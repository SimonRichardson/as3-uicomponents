package org.osflash.ui.errors
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class AbstractMethodError extends Error
	{

		public function AbstractMethodError(message : String = "")
		{
			super(message == '' ? 'AbstractMethodError please override this methid' : message);
		}
	}
}
