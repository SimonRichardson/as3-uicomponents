package org.osflash.ui.utils
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class UIAlignment
	{

		public static const TOP_LEFT : UIAlignment = new UIAlignment(0x0001);

		public static const TOP_CENTER : UIAlignment = new UIAlignment(0x0002);

		public static const TOP_RIGHT : UIAlignment = new UIAlignment(0x0003);

		public static const CENTER_LEFT : UIAlignment = new UIAlignment(0x0004);

		public static const CENTER_CENTER : UIAlignment = new UIAlignment(0x0005);

		public static const CENTER_RIGHT : UIAlignment = new UIAlignment(0x0006);

		public static const BOTTOM_LEFT : UIAlignment = new UIAlignment(0x0007);

		public static const BOTTOM_CENTER : UIAlignment = new UIAlignment(0x0008);

		public static const BOTTOM_RIGHT : UIAlignment = new UIAlignment(0x0009);
		
		/**
		 * @private
		 */		
		private var _type : int;

		public function UIAlignment(type : int)
		{
			if (isNaN(type)) throw new ArgumentError('Type can no be NaN');

			_type = type;
		}
	}
}
