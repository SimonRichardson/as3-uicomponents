package org.osflash.ui.components.themes.graphic.analog.colours
{
	import org.osflash.ui.components.themes.graphic.analog.IUIAnalogRotaryKnobColourScheme;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicsData;

	import flash.display.GraphicsSolidFill;
	import flash.display.GraphicsStroke;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIAnalogRotaryKnobDefaultColourScheme implements IUIAnalogRotaryKnobColourScheme
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

		public function UIAnalogRotaryKnobDefaultColourScheme()
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
