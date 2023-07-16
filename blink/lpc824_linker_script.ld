MEMORY
{
    vectors : org = 0x00000000, len = 192
    code : org = 0x000000C0, len = 28480
    consts : org = 0x00007000, len = 4k
    ram : org = 0x10000000, len = 8k  
}
  
SECTIONS
{
        
	. = ORIGIN(vectors);
        .vectors : {
		  *(.vectors); /* interrupt vectors */
        } > vectors

	. = ORIGIN(code);
        .text : {
		  *(.text);
        } > code
       
        . = ORIGIN(consts);
        .data : {
        	*(.data);
        } > consts
        
	. = ORIGIN(ram);
	.bss : {
	  
	    *(.bss);
	  
	} > ram
}
