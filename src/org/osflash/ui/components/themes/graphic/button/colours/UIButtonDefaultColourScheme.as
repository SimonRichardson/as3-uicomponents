package org.osflash.ui.components.themes.graphic.button.colours
{
	import org.osflash.ui.components.themes.graphic.button.IUIButtonColourScheme;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicsData;

	import flash.display.GraphicsSolidFill;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIButtonDefaultColourScheme implements IUIButtonColourScheme
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

		public function UIButtonDefaultColourScheme()
		{
			_up = new UIGraphicsData(new GraphicsSolidFill(0xbb00bb, 0.5));
			_over = new UIGraphicsData(new GraphicsSolidFill(0xff00ff, 0.5));
			_down = new UIGraphicsData(new GraphicsSolidFill(0xffffff, 0.75));
		}
		
		/**
		 * @inheritDoc
		 */
		public function get backgroundUp() : UIGraphicsData { return _up; }

		/**
		 * @inheritDoc
		 */
		public function get backgroundOver() : UIGraphicsData { return _over; }
		
		/**
		 * @inheritDoc
		 */
		public function get backgroundDown() : UIGraphicsData { return _down; }
	}
}
