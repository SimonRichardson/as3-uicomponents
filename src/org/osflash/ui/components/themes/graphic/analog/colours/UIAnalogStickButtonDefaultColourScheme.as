package org.osflash.ui.components.themes.graphic.analog.colours
{
	import org.osflash.ui.components.themes.graphic.button.IUIButtonColourScheme;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicsData;

	import flash.display.GraphicsSolidFill;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIAnalogStickButtonDefaultColourScheme implements IUIButtonColourScheme
	{

		/**
		 * @private
		 */
		private var _up : UIGraphicsData;
		
		/**
		 * @private
		 */
		private var _over : UIGraphicsData;
		
		/**
		 * @private
		 */
		private var _down : UIGraphicsData;

		public function UIAnalogStickButtonDefaultColourScheme()
		{
			_up = new UIGraphicsData(new GraphicsSolidFill(0xbb00bb, 1));
			_over = new UIGraphicsData(new GraphicsSolidFill(0xff00ff, 1));
			_down = new UIGraphicsData(new GraphicsSolidFill(0x00ffff, 1));
		}
		
		/**
		 * @inheritDoc
		 */
		public function get up() : UIGraphicsData { return _up; }

		/**
		 * @inheritDoc
		 */
		public function get over() : UIGraphicsData { return _over; }
		
		/**
		 * @inheritDoc
		 */
		public function get down() : UIGraphicsData { return _down; }
	}
}
