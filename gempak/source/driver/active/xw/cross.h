/************************************************************************
 * CROSS.H								*
 *									*
 * This include file defines the cross-hair cursor used for getting	*
 * user input map locations from the mouse.				*
 *									*
 **									*
 * Log:									*
 * S. Jacobs/NMC	 7/94		General clean up		*
 * D  Himes/Comet	 8/94		Make cross data unsigned to     *
 *					eliminate compiler warnings on  *
 *					Solaris 2.3                     *
 ***********************************************************************/

#define CROSS_WIDTH 16
#define CROSS_HEIGHT 16
#define CROSS_X_HOT 7
#define CROSS_Y_HOT 8

static unsigned char cross_bits[] = {
	0x00, 0x00, 0xc0, 0x01, 0xc0, 0x01, 0xc0, 0x01,
	0xc0, 0x01, 0xc0, 0x01, 0xc0, 0x01, 0xff, 0x7f,
	0xff, 0x7f, 0xff, 0x7f, 0xc0, 0x01, 0xc0, 0x01,
	0xc0, 0x01, 0xc0, 0x01, 0xc0, 0x01, 0xc0, 0x01 };

#define CROSSMASK_WIDTH 16
#define CROSSMASK_HEIGHT 16

static unsigned char crossmask_bits[] = {
	0x00, 0x00, 0xf0, 0x07, 0xf0, 0x07, 0xf0, 0x07,
	0xf0, 0x07, 0xff, 0x7f, 0xff, 0x7f, 0xff, 0x7f,
	0xff, 0x7f, 0xff, 0x7f, 0xff, 0x7f, 0xff, 0x7f,
	0xf0, 0x07, 0xf0, 0x07, 0xf0, 0x07, 0xf0, 0x07 };
