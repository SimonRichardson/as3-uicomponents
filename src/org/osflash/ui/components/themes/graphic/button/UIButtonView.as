package org.osflash.ui.components.themes.graphic.button
{
	import org.osflash.ui.components.button.IUIButtonView;
	import org.osflash.ui.components.button.UIButton;
	import org.osflash.ui.components.button.UIButtonSignalProxy;
	import org.osflash.ui.components.component.IUIComponent;
	import org.osflash.ui.components.component.UIComponentStateAction;
	import org.osflash.ui.components.text.IUILabelView;
	import org.osflash.ui.components.text.UILabel;
	import org.osflash.ui.components.text.UILabelSignalProxy;
	import org.osflash.ui.components.themes.graphic.component.IUIComponentViewConfig;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicComponentView;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicsData;
	import org.osflash.ui.geom.UIRectangle;
	import org.osflash.ui.signals.ISignalTarget;
	import org.osflash.ui.utils.UIAlignment;

	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	import flash.geom.Point;
	import flash.text.engine.BreakOpportunity;


	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIButtonView extends UIGraphicComponentView implements IUIButtonView
	{
		
		/**
		 * @private
		 */
		private var _component : UIButton;
		
		/**
		 * @private
		 */
		private var _container :  DisplayObjectContainer;
		
		/**
		 * @private
		 */
		private var _signalProxy : UIButtonSignalProxy;
		
		/**
		 * @private
		 */
		private var _background : Shape;
		
		/**
		 * @private
		 */
		private var _config : IUIButtonViewConfig;
		
		/**
		 * @private
		 */
		private var _colourScheme : IUIButtonColourScheme;
		
		/**
		 * @private
		 */
		private var _graphicsData : UIGraphicsData;
		
		/**
		 * @private
		 */
		private var _label : UILabel;
		
		/**
		 * @private
		 */
		private var _labelView : IUILabelView;
		
		/**
		 * @private
		 */
		private var _labelSignalProxy : UILabelSignalProxy;
				
		public function UIButtonView(config : IUIButtonViewConfig)
		{
			super();
			
			_config = config;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function bind(component : IUIComponent) : void
		{
			super.bind(component);
						
			_component = UIButton(component);
			
			_labelView = _config.labelView;
			_labelView.breakOpportunity = BreakOpportunity.NONE;
			
			_label = new UILabel(_labelView);
			
			_container = _component.displayObjectContainer;
			_container.addChild(_background = new Shape());
			_container.addChild(_label.displayObject);
			
			_labelSignalProxy = UILabelSignalProxy(_label.signalProxy);
			_labelSignalProxy.textChanged.add(handleTextUpdateSignal);

			_signalProxy = UIButtonSignalProxy(_component.signalProxy);
			_signalProxy.textChanged.add(handleTextUpdateSignal);
			_signalProxy.action.add(handleActionSignal);
			
			initConfig(_config);
		}
				
		/**
		 * @inheritDoc
		 */	
		override public function unbind() : void
		{
			_component = null;
			_container = null;
			
			if(null != _background)
			{
				if(null != _background.parent)
					_background.parent.removeChild(_background);
				_background = null;
			}
			
			if(null != _label) 
			{
				if(null != _label.displayObject.parent)
					_label.displayObject.parent.removeChild(_label.displayObject);
				_label = null;
				_labelView = null;
			}
			
			if(null != _labelSignalProxy)
			{
				_labelSignalProxy.textChanged.remove(handleTextUpdateSignal);
				_labelSignalProxy = null;
			}
			
			if(null != _signalProxy)
			{
				_signalProxy.textChanged.remove(handleTextUpdateSignal);
				_signalProxy.action.remove(handleActionSignal);
				_signalProxy = null;
			}
			
			_graphicsData = null;
			_colourScheme = null;
			
			super.unbind();
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function captureTarget(point : Point) : ISignalTarget
		{
			if(!_container.visible || !_component.enabled) return null;
			point = _container.globalToLocal(point);
			return innerBounds.containsPoint(point) ? _component : null;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function resizeTo(width : int, height : int) : void
		{
			super.resizeTo(width, height);
			
			_label.x = padding.left;
			_label.y = padding.top;

			width -= (padding.left + padding.right);
			height -= (padding.top + padding.bottom);

			_label.resizeTo(width, height);
						
			repaint();
		}
		
		/**
		 * @private
		 */	
		override protected function initConfig(config : IUIComponentViewConfig) : void
		{
			super.initConfig(config);
			
			_colourScheme = _config.colourScheme;
			
			_graphicsData = _colourScheme.backgroundUp;
			
			_graphicsData.radiusTL = _config.cornerTopLeft;
			_graphicsData.radiusTR = _config.cornerTopRight; 
			_graphicsData.radiusBL = _config.cornerBottomLeft;
			_graphicsData.radiusBR = _config.cornerBottomRight;	
			
			textAlignment = UIAlignment.CENTER_CENTER;
			iconAlignment = UIAlignment.CENTER_LEFT;
			
			autoEllipsis = _config.autoEllipsis;
			bindIconToLabel = _config.bindIconToLabel;
		}
		
		/**
		 * @private
		 */
		protected function repaint() : void
		{
			graphics.context(_background.graphics);
			
			graphics.clear();
			graphics.style(_graphicsData);
			graphics.drawRectangle(innerBounds);
			graphics.endFill();
		}
		
		/**
		 * Measure the current component width
		 */
		public function measure(measureResult : UIRectangle) : void 
		{
			_label.measure(measureResult);
			
			measureResult.width += (padding.left + padding.right);
			measureResult.height += (padding.top + padding.bottom);
		}
		
		/**
		 * @private
		 */
		protected function handleTextUpdateSignal(value : String) : void
		{
			
		}
		
		/**
		 * @private
		 */
		protected function handleActionSignal(value : int) : void
		{
			if((value & UIComponentStateAction.PRESSED) != 0)
				_graphicsData = _colourScheme.backgroundDown;
			else 
			{
				if((value & UIComponentStateAction.HOVERED) != 0)
					_graphicsData = _colourScheme.backgroundOver;
				else
					_graphicsData = _colourScheme.backgroundUp;
			}
						
			repaint();
		}
		
		public function get textAlignment() : UIAlignment { return _labelView.textAlignment; }
		public function set textAlignment(value : UIAlignment) : void { _labelView.textAlignment = value; }

		public function get iconAlignment() : UIAlignment { return _labelView.iconAlignment; }
		public function set iconAlignment(value : UIAlignment) : void { _labelView.iconAlignment = value; }

		public function get iconTextSpace() : int { return _labelView.iconTextSpace; }
		public function set iconTextSpace(value : int) : void { _labelView.iconTextSpace = value; }

		public function get italic() : Boolean { return _labelView.italic; }
		public function set italic(value : Boolean) : void { _labelView.italic = value; }

		public function get bold() : Boolean { return _labelView.bold; }
		public function set bold(value : Boolean) : void { _labelView.bold = value; }

		public function get fontSize() : int { return _labelView.fontSize; }
		public function set fontSize(value : int) : void { _labelView.fontSize = value; }

		public function get fontColor() : int { return _labelView.fontColor; }
		public function set fontColor(value : int) : void { _labelView.fontColor = value; }

		public function get autoEllipsis() : Boolean { return _labelView.autoEllipsis; }
		public function set autoEllipsis(value : Boolean) : void { _labelView.autoEllipsis = value; }

		public function get lineSpacing() : int { return _labelView.lineSpacing; }
		public function set lineSpacing(value : int) : void { _labelView.lineSpacing = value; }

		public function get bindIconToLabel() : Boolean { return _labelView.bindIconToText; }
		public function set bindIconToLabel(value : Boolean) : void { _labelView.bindIconToText = value; }

		public function get cornerRadiusTL() : Number { return _graphicsData.radiusTL; }
		public function set cornerRadiusTL(value : Number) : void
		{
			if (_graphicsData.radiusTL != value)
			{
				_graphicsData.radiusTL = value;

				repaint();
			}
		}

		public function get cornerRadiusTR() : Number { return _graphicsData.radiusTR; }
		public function set cornerRadiusTR(value : Number) : void
		{
			if (_graphicsData.radiusTR != value)
			{
				_graphicsData.radiusTR = value;

				repaint();
			}
		}

		public function get cornerRadiusBL() : Number { return _graphicsData.radiusBL; }
		public function set cornerRadiusBL(value : Number) : void
		{
			if (_graphicsData.radiusBL != value)
			{
				_graphicsData.radiusBL = value;

				repaint();
			}
		}

		public function get cornerRadiusBR() : Number { return _graphicsData.radiusBR; }
		public function set cornerRadiusBR(value : Number) : void
		{
			if (_graphicsData.radiusBR != value)
			{
				_graphicsData.radiusBR = value;

				repaint();
			}
		}
	}
}
