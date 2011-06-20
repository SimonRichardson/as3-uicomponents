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
		private var _backgroundUp : UIGraphicsData;
		
		/**
		 * @private
		 */
		private var _backgroundOver : UIGraphicsData;
		
		/**
		 * @private
		 */
		private var _backgroundDown : UIGraphicsData;

		public function UIAnalogStickButtonDefaultColourScheme()
		{
			_backgroundUp = new UIGraphicsData(new GraphicsSolidFill(0xbb00bb, 1));
			_backgroundOver = new UIGraphicsData(new GraphicsSolidFill(0xff00ff, 1));
			_backgroundDown = new UIGraphicsData(new GraphicsSolidFill(0x00ffff, 1));
		}
		
		/**
		 * @inheritDoc
		 */
		public function get backgroundUp() : UIGraphicsData { return _backgroundUp; }

		/**
		 * @inheritDoc
		 */
		public function get backgroundOver() : UIGraphicsData { return _backgroundOver; }
		
		/**
		 * @inheritDoc
		 */
		public function get backgroundDown() : UIGraphicsData { return _backgroundDown; }
	}
}
