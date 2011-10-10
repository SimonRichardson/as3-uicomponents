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
		
		/**
		 * @private
		 */
		private var _trbl : UIGraphicsRectRadius;
		
		public function UIGraphicsData(	fillStyle : IGraphicsFill = null,
										lineStyle : GraphicsStroke = null,
										lineFillStyle : IGraphicsFill = null
										)
		{
			_fillStyle = fillStyle;
			_lineStyle = lineStyle;
			_lineFillStyle = lineFillStyle;
			
			_trbl = new UIGraphicsRectRadius();
		}
		
		public function get fillStyle() : IGraphicsFill { return _fillStyle; }
		
		public function get lineStyle() : GraphicsStroke { return _lineStyle; }
		
		public function get lineFillStyle() : IGraphicsFill { return _lineFillStyle; }
		
		public function get radiusTL() : Number { return _trbl.topLeft; }
		public function set radiusTL(value : Number) : void { _trbl.topLeft = value; }
		
		public function get radiusTR() : Number { return _trbl.topRight; }
		public function set radiusTR(value : Number) : void { _trbl.topRight = value; }
		
		public function get radiusBL() : Number { return _trbl.bottomLeft; }
		public function set radiusBL(value : Number) : void { _trbl.bottomLeft = value; }
		
		public function get radiusBR() : Number { return _trbl.bottomRight; }
		public function set radiusBR(value : Number) : void { _trbl.bottomRight = value; }
		
	}
}
