/* useful reference: www.linuxselfhelp.com/gnu/ld/html_chapter/ld_toc.html */
/* Written by Frank Duignan */
MEMORY
{
    vectors : org = 0x00000000, len = 192
    code : org = 0x000000C0, len = 28480
    consts : org = 0x00001000, len = 4k
    ram : org = 0x10000000, len = 8k  
}
  
SECTIONS
{
        
	. = ORIGIN(vectors);
        .vectors : {
		  *(.vectors); /* The interrupt vectors */
        } > vectors

	. = ORIGIN(code);
        .text : {
		  *(.text);
        } > code
       
       
       
        /*. = ORIGIN(consts); */
        .data ALIGN (0x10) : {
        	*(.data);
        }
        
	. = ORIGIN(ram);
	.bss : {
	  
	    *(.bss);
	  
	} > ram
}
