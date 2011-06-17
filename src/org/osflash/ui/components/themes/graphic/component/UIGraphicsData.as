package org.osflash.ui.components.themes.graphic.component
{
	import flash.display.GraphicsStroke;
	import flash.display.IGraphicsFill;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIGraphicsData
	{
		
		/**
		 * @private
		 */
		private var _fillStyle : IGraphicsFill;
		
		/**
		 * @private
		 */
		private var _lineStyle : GraphicsStroke;
		
		/**
		 * @private
		 */
		private var _lineFillStyle : IGraphicsFill;
		
		public function UIGraphicsData(	fillStyle : IGraphicsFill = null,
										lineStyle : GraphicsStroke = null,
										lineFillStyle : IGraphicsFill = null
										)
		{
			_fillStyle = fillStyle;
			_lineStyle = lineStyle;
			_lineFillStyle = lineFillStyle;
		}
		
		public function get fillStyle() : IGraphicsFill { return _fillStyle; }
		
		public function get lineStyle() : GraphicsStroke { return _lineStyle; }
		
		public function get lineFillStyle() : IGraphicsFill { return _lineFillStyle; }
		
	}
}
