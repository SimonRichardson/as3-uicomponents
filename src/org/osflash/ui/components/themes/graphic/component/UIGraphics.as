package org.osflash.ui.components.themes.graphic.component
{
	import flash.display.Graphics;
	import flash.display.GraphicsPath;
	import flash.display.GraphicsPathCommand;
	import flash.display.GraphicsStroke;
	import flash.display.IGraphicsData;
	import flash.display.IGraphicsFill;
	import flash.errors.IllegalOperationError;
	import flash.geom.Rectangle;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIGraphics
	{
		
		/**
		 * @private
		 */
		private var _graphics : Graphics;
		
		/**
		 * @private
		 */
		private var _fillGraphicData : IGraphicsFill;
		
		/**
		 * @private
		 */
		private var _lineStrokeGraphicData : GraphicsStroke;
		
		/**
		 * @private
		 */
		private var _lineFillGraphicData : IGraphicsFill; 
		
		/**
		 * @private
		 */
		private var _graphicsData : Vector.<IGraphicsData>;
		
		/**
		 * @private
		 */
		private var _graphicPath : GraphicsPath;
		
		/**
		 * @private
		 */
		private const _moveToCommand : int = GraphicsPathCommand.MOVE_TO;
		
		/**
		 * @private
		 */
		private const _lineToCommand : int = GraphicsPathCommand.LINE_TO;
		
		/**
		 * @private
		 */
		private const _curveToCommand : int = GraphicsPathCommand.CURVE_TO;

		public function UIGraphics()
		{
			_graphicPath = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
			_graphicsData = new Vector.<IGraphicsData>();
		}
		
		public function clear() : void
		{
			_graphics.clear();
			
			_fillGraphicData = null;
			
			_lineStrokeGraphicData = null;
			_lineFillGraphicData = null;
			
			_graphicsData.length = 0;
			
			_graphicPath.commands.length = 0;
			_graphicPath.data.length = 0;
		}
		
		public function context(value : Graphics) : void
		{
			if(null == value) throw new ArgumentError('Graphics can not be null');
			
			_graphics = value;
		}
		
		public function style(value : UIGraphicsData) : void
		{
			if(null == value) throw new ArgumentError('UIGraphicsData can not be null');
			
			if(null != value.fillStyle) beginFill(value.fillStyle);
			if(null != value.lineStyle) lineStyle(value.lineStyle, value.lineFillStyle);
		}
		
		public function beginFill(value : IGraphicsFill) : void
		{
			if(null == value) throw new ArgumentError('IGraphicsFill can not be null');
			
			_fillGraphicData = value;
		}
		
		public function lineStyle(stroke : GraphicsStroke, fill : IGraphicsFill) : void
		{
			if(null == stroke) throw new ArgumentError('IGraphicsStroke can not be null');
			if(null == fill) throw new ArgumentError('IGraphicsFill can not be null');
			
			stroke.fill = fill;
			
			_lineStrokeGraphicData = stroke;
			_lineFillGraphicData = fill;
		}
		
		public function drawRect(x : Number, y : Number, width : Number, height : Number) : void
		{
			_graphicPath.commands.push(	_moveToCommand, 
										_lineToCommand, 
										_lineToCommand, 
										_lineToCommand,
										_lineToCommand
										);
			_graphicPath.data.push(	x, y,
									width, y,
									width, height,
									x, height,
									x, y
									);
		}
			
		public function drawRectangle(value : Rectangle) : void
		{
			if(null == value) throw new ArgumentError('Rectangle can not be null');
			
			_graphicPath.commands.push(	_moveToCommand, 
										_lineToCommand, 
										_lineToCommand, 
										_lineToCommand,
										_lineToCommand
										);
			_graphicPath.data.push(	value.x, value.y,
									value.x + value.width, value.y,
									value.x + value.width, value.y + value.height,
									value.x, value.y + value.height,
									value.x, value.y
									);
		}
		
		public function drawRoundRectangle(value : Rectangle, radius : Number) : void
		{
			if(null == value) throw new ArgumentError('Rectangle can not be null');
			
			_graphicPath.commands.push(	_moveToCommand,
										_curveToCommand,
										_lineToCommand,
										_curveToCommand,
										_lineToCommand,
										_curveToCommand,
										_lineToCommand,
										_curveToCommand,
										_lineToCommand
										);
			
			_graphicPath.data.push ( value.width - radius, 0,
									 value.width, 0, value.width, radius,
									 value.width, value.height - radius,
									 value.width, value.height, value.width - radius, value.height,
									 radius, value.height,
									 0, value.height, 0, value.height - radius,
									 0, radius,
									 0, 0, radius, 0,
									 value.width - radius, 0
									 );
		}
		
		public function drawRoundRectangleComplex(value : Rectangle, radius : UIGraphicsRectRadius) : void
		{
			if(null == value) throw new ArgumentError('Rectangle can not be null');
			
			_graphicPath.commands.push(	_moveToCommand,
										_curveToCommand,
										_lineToCommand,
										_curveToCommand,
										_lineToCommand,
										_curveToCommand,
										_lineToCommand,
										_curveToCommand,
										_lineToCommand
										);
			
			_graphicPath.data.push ( value.width - radius.topRight, 0,
									 value.width, 0, value.width, radius.topRight,
									 value.width, value.height - radius.bottomRight,
									 value.width, value.height, value.width - radius.bottomRight, value.height,
									 radius.bottomLeft, value.height,
									 0, value.height, 0, value.height - radius.bottomLeft,
									 0, radius.topLeft,
									 0, 0, radius.topLeft, 0,
									 value.width - radius.topLeft, 0
									 );
									 
		}
		
		public function drawCircle(x : Number, y : Number, radius : Number) : void
		{
			_graphicPath.commands.push(	_moveToCommand, 
										_curveToCommand, 
										_curveToCommand, 
										_curveToCommand,
										_curveToCommand,
										_curveToCommand,
										_curveToCommand,
										_curveToCommand,
										_curveToCommand
										);
			
			const u : Number = radius * 0.4086;
			const v : Number = radius * 0.7071;
			
			_graphicPath.data.push(	x - radius, y,
									x - radius, y - u, x - v, y - v,
									x - u, y - radius, x, y - radius,
									x + u, y - radius, x + v, y - v,
									x + radius, y - u, x + radius, y,
									x + radius, y + u, x + v, y + v,
									x + u, y + radius, x, y + radius,
									x - u, y + radius, x - v, y + v,
									x - radius, y + u, x - radius, y
									);			
		}
				
		public function endFill() : void
		{
			if(null == _graphics) throw new IllegalOperationError('Graphics context is null');
			
			if(null != _fillGraphicData) _graphicsData.push(_fillGraphicData);
			if(null != _lineStrokeGraphicData) _graphicsData.push(_lineStrokeGraphicData);
						
			_graphicsData.push(_graphicPath);
			
			_graphics.drawGraphicsData(_graphicsData);
		}
		
		public function get graphicsData() : Vector.<IGraphicsData>
		{
			return _graphicsData;
		}

		public function get graphicPath() : GraphicsPath
		{
			return _graphicPath;
		}
	}
}
