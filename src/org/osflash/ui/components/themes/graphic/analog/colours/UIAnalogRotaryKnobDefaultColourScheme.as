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
		private var _backgroundUp : UIGraphicsData;
		
		/**
		 * @private
		 */
		private var _backgroundOver : UIGraphicsData;
		
		/**
		 * @private
		 */
		private var _backgroundDown : UIGraphicsData;
		
		/**
		 * @private
		 */
		private var _knobUp : UIGraphicsData;
		
		/**
		 * @private
		 */
		private var _knobOver : UIGraphicsData;
		
		/**
		 * @private
		 */
		private var _knobDown : UIGraphicsData;

		public function UIAnalogRotaryKnobDefaultColourScheme()
		{
			const fill : GraphicsSolidFill = new GraphicsSolidFill(0x1b1b1b);
			const strokeStyle : GraphicsStroke = new GraphicsStroke(2);
			
			_backgroundUp = new UIGraphicsData(	fill, 
												strokeStyle, 
												new GraphicsSolidFill(0x333333, 1)
												);
			_backgroundOver = new UIGraphicsData(	fill, 
													strokeStyle, 
													new GraphicsSolidFill(0x000000, 1)
													);
			_backgroundDown = new UIGraphicsData(	fill, 
													strokeStyle, 
													new GraphicsSolidFill(0x000000, 1)
													);
			
			_knobUp = new UIGraphicsData(new GraphicsSolidFill(0xbb00bb));
			_knobOver = new UIGraphicsData(new GraphicsSolidFill(0xff00ff));
			_knobDown = new UIGraphicsData(new GraphicsSolidFill(0x00ffff));
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
		
		/**
		 * @inheritDoc
		 */
		public function get knobUp() : UIGraphicsData { return _knobUp; }

		/**
		 * @inheritDoc
		 */
		public function get knobOver() : UIGraphicsData { return _knobOver; }
		
		/**
		 * @inheritDoc
		 */
		public function get knobDown() : UIGraphicsData { return _knobDown; }
	}
}
