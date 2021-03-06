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
		private var _backgroundUp : UIGraphicsData;
		
		/**
		 * @private
		 */
		private var _backgroundOver : UIGraphicsData;
		
		/**
		 * @private
		 */
		private var _backgroundDown : UIGraphicsData;

		public function UIAnalogStickDefaultColourScheme()
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
