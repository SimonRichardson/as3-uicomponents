package org.osflash.ui.components.themes.graphic.analog.colours
{
	import flash.display.GraphicsStroke;
	import org.osflash.ui.components.themes.graphic.analog.IUIAnalogStickColourScheme;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicsData;

	import flash.display.GraphicsSolidFill;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIAnalogStickDefaultColourScheme implements IUIAnalogStickColourScheme
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

		public function UIAnalogStickDefaultColourScheme()
		{
			const fill : GraphicsSolidFill = new GraphicsSolidFill(0x1b1b1b);
			const strokeStyle : GraphicsStroke = new GraphicsStroke(2);
			
			_up = new UIGraphicsData(fill, strokeStyle, new GraphicsSolidFill(0x333333, 1));
			_over = new UIGraphicsData(fill, strokeStyle, new GraphicsSolidFill(0x000000, 1));
			_down = new UIGraphicsData(fill, strokeStyle, new GraphicsSolidFill(0x000000, 1));
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
