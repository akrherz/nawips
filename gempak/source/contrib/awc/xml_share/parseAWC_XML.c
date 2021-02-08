#include <stdio.h>
#include <assert.h>
#include "geminc.h"
#include "gemprm.h"
#include "parseAWC_XML.h"

#define MAXST 128
#define MXXPATH 200
#define ONEBLOCK 2048

/************************************************************************
  This library module contains subroutines to parse XML elements via an
  XPath expression and store the result in a specific data type variable.
  
  Contents:
   Public Functions...
    get_number_of_nodes
    getInfo
    getInfoStr
    getInfoStrbySub
    getInfoInt
    getInfoIntbySub
    getInfoFloat
    getInfoFloatbySub
    elementExists
    loadXmlfile
    
   Private Function...
     af_catStr
**
  Log:
  L. Hinson/AWC         02/10    Created
************************************************************************/
    
static void af_catStr ( char **str1, char *str2);
static long _capacity = ONEBLOCK;

int get_number_of_nodes(xmlDocPtr doc,const xmlChar* xpathExpr)
{
  xmlXPathContextPtr xpathCtx;
  xmlXPathObjectPtr xpathObj;
  int numberNodes=0;
  assert(xpathExpr);
  xpathCtx = xmlXPathNewContext(doc);
  if(xpathCtx == NULL) {
    fprintf(stderr,"Error: unable to create new XPath context\n");
    xmlFreeDoc(doc);
    return(-1);
  }
  xpathObj = xmlXPathEvalExpression(xpathExpr,xpathCtx);
  if(xpathObj == NULL) {
    fprintf(stderr,"Error: unable to evaluate xpath expression \"%s\"\n",
xpathExpr);
    xmlXPathFreeContext(xpathCtx);
    xmlFreeDoc(doc);
    return(-1);
  }
  /* Cleanup */
  numberNodes=(xpathObj->nodesetval) ? xpathObj->nodesetval->nodeNr: 0;
  xmlXPathFreeObject(xpathObj);
  xmlXPathFreeContext(xpathCtx);
  return (numberNodes);
}

int getInfo(xmlDocPtr doc, const xmlChar* xpathExpr,char* output)
{
  xmlNodePtr cur;
  int size;
  xmlNodeSetPtr nodes;
  xmlXPathContextPtr xpathCtx;
  xmlXPathObjectPtr xpathObj;
  assert(xpathExpr);
  output[0]='\0';
  xpathCtx = xmlXPathNewContext(doc);
  if(xpathCtx == NULL) {
    fprintf(stderr,"Error: unable to create new XPath context\n");
    xmlFreeDoc(doc);
    return(-1);
  }
  xpathObj = xmlXPathEvalExpression(xpathExpr,xpathCtx);
  if(xpathObj == NULL) {
    fprintf(stderr,"Error: unable to evaluate xpath expression \"%s\"\n",
xpathExpr);
    xmlXPathFreeContext(xpathCtx);
    xmlFreeDoc(doc);
    return(-1);
  }
  nodes =  xpathObj->nodesetval;
  size = (nodes) ? nodes->nodeNr : 0;

  if (size > 1)
    printf("Warning... More than one node found for this xpathexpr: %s\n",
xpathExpr);
  if (size > 0) {
    assert(nodes->nodeTab[0]);
    cur=nodes->nodeTab[0];
    if (cur->children)
      if (!xmlStrcmp(cur->children->name,(unsigned char *) "text")) {
      strcpy(output,(const char *) cur->children->content);
      }
      ;
  }
  /* Cleanup */
  xmlXPathFreeObject(xpathObj);
  xmlXPathFreeContext(xpathCtx);
  return(size);
}

void getInfoStr(xmlDocPtr doc, const char* xpathExpr, const char* element, char*
str)
{
  char fullxpathExpr[MXXPATH];
  int num;
  sprintf(fullxpathExpr,"%s%s",xpathExpr,element);
  num=getInfo(doc,(xmlChar *)fullxpathExpr,str);
  if (num==0) {
    str[0]='\0';
    printf("getInfoStr::Could not find value for XPATH=%s%s\n",xpathExpr,
            element);
  }
}

void getInfoStrbySub(xmlDocPtr doc, const char* xpathExpr, const char*
element_cstring, int sub, char* str)
{
  char elementwrk[MXXPATH];
  sprintf(elementwrk,element_cstring,sub);
  getInfoStr(doc,xpathExpr,elementwrk,str);
}

void getInfoInt(xmlDocPtr doc, const char* xpathExpr,const char* element,int*
number)
{
  char fullxpathExpr[MXXPATH];
  char str[MAXST];
  int num;
  sprintf(fullxpathExpr,"%s%s",xpathExpr,element);
  num=getInfo(doc, (xmlChar *) fullxpathExpr,str);
  if (strstr(str,"SFC")==NULL && str[0] != '\0') {
    if (num > 0) {
      if (sscanf(str,"%d",number) != 1) *number=0;
    } else {
      *number=0;
      printf("getInfoInt::Could not find value for XPATH=%s%s\n",xpathExpr,
           element);
    }
  } else {
    *number=0;
  }
}

void getInfoIntbySub(xmlDocPtr doc, const char* xpathExpr,const char*
element_cstring,int sub,int *number)
{
  char elementwrk[MXXPATH];
  sprintf(elementwrk,element_cstring,sub);
  getInfoInt(doc, xpathExpr, elementwrk, number);
}

void getInfoFloat(xmlDocPtr doc, const char* xpathExpr,const char*
element,float* real)
{
  char fullxpathExpr[MXXPATH];
  char str[MAXST];
  int num;
  sprintf(fullxpathExpr,"%s%s",xpathExpr,element);
  num=getInfo(doc,BAD_CAST fullxpathExpr,str);
  if (num > 0)
    sscanf(str,"%f",real);
  else {
    *real=0.0;
    printf("getInfoFloat::Could not find value for XPATH=%s%s\n",xpathExpr,
           element);
  }
}

void getInfoFloatbySub(xmlDocPtr doc, const char* xpathExpr,const char*
element_cstring, int sub, float *real)
{
  char elementwrk[MXXPATH];
  sprintf(elementwrk,element_cstring,sub);
  getInfoFloat(doc, xpathExpr, elementwrk, real);
}

int elementExists(xmlDocPtr doc, const char* xpathExpr, const char* element)
{
  char fxpathExpr[MXXPATH];
  sprintf(fxpathExpr,"%s%s",xpathExpr,element);
  if (get_number_of_nodes(doc, (xmlChar *) fxpathExpr) > 0)
    return (1);
  else
    return (0);
}

void loadXmlfile(char **xmlString, char *filename, int *ier)
{
/**********************************************************************
  This routine reads an XML file and stores the contents to xmlString

  Input parameters:
  xmlString    char**  Pointer to XML Character String
  filename     char*   Name of XML file to open
  Output parameters:
  ier          int*    Error status
  Log:
  L. Hinson/AWC      01/07         Created
**********************************************************************/
  FILE *fin;
  char line[ONEBLOCK];
  *ier=0;
  fin = fopen(filename,"rt");
  if(fin != NULL) {
    while (fgets(line,ONEBLOCK-1,fin) !=NULL ) {
      af_catStr(xmlString,line);
    }
    fclose(fin);
  } else {
    printf("Could not read %s\n",filename);
    exit(1);
  }
}

static void af_catStr ( char **str1, char *str2)
/************************************************************************
    * af_catStr                                                            *
    *                                                                      *
    * This routine adds str2 at the end of str1 and realloc memory for str1*
    * if str1 is not large enough to add str2.                             *
    *                                                                      *
    *                                                                      *
    * static void af_catStr ( str1, str2 )                                 *
    *                                                                      *
    * Input parameters:                                                    *
    *      **str1          char            string                          *
    *      *str2           char            string to add to str2           *
    **                                                                     *
    * Log:                                                                 *
    * B. Yin/SAIC          11/04           Created                         *
    * B. Yin/SAIC          12/04           Fixed the capacity bug          *
 ***********************************************************************/
{
  if ( (long)(strlen( *str1 ) + strlen( str2 )) >= _capacity ) {
    G_REALLOC ( *str1, char, _capacity + ONEBLOCK, "af_format" );
    _capacity += ONEBLOCK;
  }
  strcat ( *str1, str2 );
}
