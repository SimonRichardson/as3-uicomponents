package org.osflash.ui.utils
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public function rint(value : int) : int 
	{
		if( value > 0 ) return value + .5;
		else if( value < 0 ) return -int( -value + .5 );
		else return 0;
	}
}
