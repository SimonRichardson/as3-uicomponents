package org.osflash.ui.components.themes.graphic.text
{
	import org.osflash.ui.geom.UIRectangle;
	import org.osflash.ui.components.component.IUIComponent;
	import org.osflash.ui.components.component.IUIComponentModel;
	import org.osflash.ui.components.component.UIComponentModel;
	import org.osflash.ui.components.component.UIComponentState;
	import org.osflash.ui.components.text.IUILabelView;
	import org.osflash.ui.components.text.UILabel;
	import org.osflash.ui.components.text.UILabelModel;
	import org.osflash.ui.components.text.UILabelSignalProxy;
	import org.osflash.ui.components.text.UITextFormat;
	import org.osflash.ui.components.text.renderers.UITextRenderer;
	import org.osflash.ui.components.themes.graphic.component.UIDisabledFilter;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicComponentView;
	import org.osflash.ui.signals.ISignalTarget;
	import org.osflash.ui.utils.UIAlignment;
	import org.osflash.ui.utils.rint;

	import flash.display.Bitmap;
	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.engine.ElementFormat;
	import flash.text.engine.FontDescription;
	import flash.text.engine.FontPosture;
	import flash.text.engine.FontWeight;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class UILabelView extends UIGraphicComponentView implements IUILabelView
	{
		
		private const UPDATE_FONT_FORMAT : int = 256;

		private const UPDATE_FONT_POSTURE : int = 512;

		private const UPDATE_FONT_ALL : int = UPDATE_FONT_FORMAT | UPDATE_FONT_POSTURE;

		/**
		 * @private
		 */
		private var _component : UILabel;
		
		/**
		 * @private
		 */
		private var _container :  DisplayObjectContainer;
		
		/**
		 * @private
		 */
		private var _signalProxy : UILabelSignalProxy;

		/**
		 * @private
		 */
		private var _text : UITextRenderer;

		/**
		 * @private
		 */
		private var _icon : Bitmap;

		/**
		 * @private
		 */
		private var _background : Shape;

		/**
		 * @private
		 */
		private var _textAlignment : UIAlignment;

		/**
		 * @private
		 */
		private var _iconAlignment : UIAlignment;

		/**
		 * @private
		 */
		private var _iconTextSpace : int;

		/**
		 * @private
		 */
		private var _bindIconToText : Boolean;

		/**
		 * @private
		 */
		private var _config : IUILabelViewConfig;

		/**
		 * @private
		 */
		private var _textFormat : UITextFormat;

		/**
		 * @private
		 */
		private var _backgroundColor : int;

		/**
		 * @private
		 */
		private var _backgroundAlpha : Number;
		
		public function UILabelView(config : IUILabelViewConfig) 
		{
			_textAlignment = UIAlignment.TOP_LEFT;
			_iconAlignment = UIAlignment.TOP_LEFT;
			
			_iconTextSpace = 0;
			
			_bindIconToText = false;
			
			_backgroundColor = 0;
			_backgroundAlpha = 0;
			 
			_config = config;
			_textFormat = _config.textFormat;
		}

		override public function bind(component : IUIComponent) : void 
		{
			super.bind(component);
			
			_component = UILabel(component);
			
			_text = new UITextRenderer(_config.elementFormat);
			_text.autoUpdate = false;
			
			_container = _component.displayObjectContainer;
			_container.addChild(_background = new Shape());
			_container.addChild(_text);
			_container.addChild(_icon = new Bitmap());
			
			_signalProxy = UILabelSignalProxy(_component.signalProxy);
			//_signalProxy.text.add(handleTextUpdateSignal);
			//_signalProxy.action.add(handleActionSignal);
			
			initConfig(_config);
		}
		
		override public function unbind() : void 
		{
			_component = null;
			_container = null;
			
			_component.displayObjectContainer.removeChild(_background);
			_component.displayObjectContainer.removeChild(_text);
			_component.displayObjectContainer.removeChild(_icon);
			
			if(null != _background)
			{
				if(null != _background.parent)
					_background.parent.removeChild(_background);
				_background = null;
			}
			
			if(null != _signalProxy)
			{
				//_signalProxy.text.remove(handleTextUpdateSignal);
				//_signalProxy.action.remove(handleActionSignal);
				_signalProxy = null;
			}
			
			super.unbind();
		}

		public function onComponentResize(width : Number, height : Number) : void 
		{
			resizeTo(width, height);
			
			if (_bindIconToText)
			{
				if (_iconAlignment == UIAlignment.TOP_CENTER || _iconAlignment == UIAlignment.BOTTOM_CENTER)
					_text.setMaxTextBlockSize(innerBounds.width, innerBounds.height - (_iconTextSpace + _icon.height));
				else
					_text.setMaxTextBlockSize(innerBounds.width - (_iconTextSpace + _icon.width), innerBounds.height);
			}
			else _text.setMaxTextBlockSize(innerBounds.width, innerBounds.height);
			
			updateTextRenderer();
			updatePositioning();
			repaint();
		}
//
//		public function onComponentModelUpdate(model : IUIComponentModel, type : int) : void 
//		{
//			switch(type)
//			{
//				case UIComponentModel.UPDATE_ALL_VALUES:
//					_text.text = _component.text;
//					_icon.bitmapData = _component.icon;
//					updateTextRenderer(UPDATE_FONT_ALL);
//					break;
//					
//				case UILabelModel.UPDATE_TEXT:
//					_text.text = _component.text;
//					updateTextRenderer(UPDATE_FONT_ALL);
//					break;
//					
//				case UILabelModel.UPDATE_ICON:
//					_icon.bitmapData = _component.icon;
//					break;
//			}
//			
//			updatePositioning();
//			repaint();
//		}
//
//		public function onComponentStateUpdate(state : UIComponentState, type : int) : void 
//		{
//			switch(type)
//			{
//				case UIComponentState.UPDATE_ENABLED:
//					UIDisabledFilter.showEnabled(_container, state.enabled);
//					break;
//					
//				case UIComponentState.UPDATE_FOCUSED:
//					UIEventManager.focus = _component;
//					break;
//			}
//		}

		public function measure(measureResult : UIRectangle) : void 
		{
			measureResult.width = _text.measuredWidth > _icon.width ? _text.measuredWidth : _icon.width;
			measureResult.height = _text.measuredHeight > _icon.height ? _text.measuredHeight : _icon.height;
			
			if (_bindIconToText)
			{
				switch(_iconAlignment)
				{
					case UIAlignment.TOP_CENTER:
					case UIAlignment.BOTTOM_CENTER:
						measureResult.height = _icon.height + _text.measuredHeight + _iconTextSpace;
						break;
						
					default:
						measureResult.width = _icon.width + _text.measuredWidth + _iconTextSpace;
				}
			}
			
			measureResult.width = measureResult.width + (padding.left + padding.right);
			measureResult.height = measureResult.height + (padding.top + padding.bottom);
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
//
//		public function processEvent(event : UIEvent) : void 
//		{
//			if (event.type == UIEventType.CONTEXT_TOOLTIP_SHOW)
//			{
//				handleTooltipForClippedText();
//			}
//			
//			handleComponentEvents(_component, event);
//		}
		
		public function textIsDisplayedPartially() : Boolean 
		{
			return _text.textIsDisplayedPartially();
		}

		protected function updateTextRenderer(type : int = 0) : void 
		{
			var fontDescription : FontDescription = null;
			var elementFormat : ElementFormat = null;
			
			if (type & UPDATE_FONT_POSTURE)
			{
				fontDescription = _text.fontDescription;
				fontDescription.fontWeight = bold ? FontWeight.BOLD : FontWeight.NORMAL;
				fontDescription.fontPosture = _textFormat.italic ? FontPosture.ITALIC : FontPosture.NORMAL;
				_text.fontDescription = fontDescription;
			}
			
			if (type & UPDATE_FONT_FORMAT)
			{
				elementFormat = _text.elementFormat;
				elementFormat.color = _textFormat.fontColor;
				elementFormat.fontSize = _textFormat.fontSize;
				_text.elementFormat = elementFormat;
			}
			
			_text.lineSpacing = _textFormat.lineSpacing;
			_text.update();
		}

		protected function updatePositioning() : void 
		{
			
			if (_bindIconToText)
			{
				if (_iconAlignment == UIAlignment.CENTER_CENTER)
				{
					throw new Error("Can\'t align icon to CENTER_CENTER when using bindIconToLabel.");
				}
				positionIconWithText();
			}
			else
			{
				if (!_component) return;
				
				var rect : Rectangle = null;
				if (_component.text)
				{
					rect = new Rectangle(0, 0, _text.textWidth, _text.textHeight);
					
					position(rect, _textAlignment);
					
					_text.x = rect.x;
					_text.y = rect.y;
				}
				
				if (_component.icon)
				{
					rect = new Rectangle(0, 0, _icon.width, _icon.height);
					
					position(rect, _iconAlignment);
					
					_icon.x = rect.x;
					_icon.y = rect.y;
				}
			}
		}

		protected function positionIconWithText() : void 
		{
			const spacing : Number = _icon.bitmapData ? _iconTextSpace : 0;
			
			var rect : Rectangle = null;
			switch(_iconAlignment)
			{
				case UIAlignment.TOP_CENTER:
				case UIAlignment.BOTTOM_CENTER:
					rect = new Rectangle(	0, 
											0, 
											_text.textWidth > _icon.width ? _text.textWidth : _icon.width, 
											_text.textHeight + spacing + _icon.height);
					break;
					
				default:
					rect = new Rectangle(	0, 
											0, 
											_text.textWidth + spacing + _icon.width, 
											_text.textHeight > _icon.height ? _text.textHeight : _icon.height);
			}
			
			position(rect, _textAlignment);
			
			const roundedX : int = rint(rect.x);
			_text.x = roundedX;
			_icon.x = roundedX;
			
			const roundedY : int = rint(rect.y);
			_text.y = roundedY;
			_icon.y = roundedY;
						
			switch(_iconAlignment)
			{
				case UIAlignment.TOP_LEFT:
					_text.x = _text.x + rint(_icon.width + spacing);
					break;
					
				case UIAlignment.TOP_CENTER:
					_icon.x = _icon.x + rint(rect.width - _icon.width >> 1);
					_text.y = _text.y + rint(_icon.height + spacing);
					break;
					
				case UIAlignment.TOP_RIGHT:
					_icon.x = _icon.x + rint(_text.textWidth + spacing);
					break;
				
				case UIAlignment.CENTER_LEFT:
					_icon.y = _icon.y + rint(rect.height - _icon.height >> 1);
					_text.x = _text.x + rint(_icon.width + spacing);
					_text.y = _text.y + rint(rect.height - _text.textHeight >> 1);
					break;
					
				case UIAlignment.CENTER_RIGHT:
					_icon.x = _icon.x + rint(_text.textWidth + spacing);
					_icon.y = _icon.y + rint(rect.height - _icon.height >> 1);
					_text.y = _text.y + rint(rect.height - _text.textHeight >> 1);
					break;
					
				case UIAlignment.BOTTOM_LEFT:
					_icon.y = _icon.y + rint(rect.height - _icon.height);
					_text.x = _text.x + rint(_icon.width + spacing);
					_text.y = _text.y + rint(rect.height - _text.textHeight);
					break;
					
				case UIAlignment.BOTTOM_CENTER:
					_icon.x = _icon.x + rint(rect.width - _icon.width >> 1);
					_icon.y = _icon.y + rint(_text.textHeight + spacing);
					break;
					
				case UIAlignment.BOTTOM_RIGHT:
					_icon.x = _icon.x + rint(_text.textWidth + spacing);
					_icon.y = _icon.y + rint(rect.height - _icon.height);
					_text.y = _text.y + rint(rect.height - _text.textHeight);
					break;
			}
		}

		protected function position(rect : Rectangle, type : UIAlignment) : void 
		{
			const w : Number = innerBounds.width - rect.width;
			const h : Number = innerBounds.height - rect.height;
			
			switch(type)
			{
				case UIAlignment.TOP_LEFT:
					rect.x = innerBounds.x;
					rect.y = innerBounds.y;
					break;
					
				case UIAlignment.TOP_CENTER:
					rect.x = innerBounds.x + w * 0.5;
					rect.y = innerBounds.y;
					break;
					
				case UIAlignment.TOP_RIGHT:
					rect.x = innerBounds.x + w;
					rect.y = innerBounds.y;
					break;
					
				case UIAlignment.CENTER_LEFT:
					rect.x = innerBounds.x;
					rect.y = innerBounds.y + h * 0.5;
					break;
					
				case UIAlignment.CENTER_CENTER:
					rect.x = innerBounds.x + w * 0.5;
					rect.y = innerBounds.y + h * 0.5;
					break;
					
				case UIAlignment.CENTER_RIGHT:
					rect.x = innerBounds.x + w;
					rect.y = innerBounds.y + h * 0.5;
					break;
					
				case UIAlignment.BOTTOM_LEFT:
					rect.x = innerBounds.x;
					rect.y = innerBounds.y + h;
					break;
					
				case UIAlignment.BOTTOM_CENTER:
					rect.x = innerBounds.x + w * 0.5;
					rect.y = innerBounds.y + h;
					break;
					
				case UIAlignment.BOTTOM_RIGHT:
					rect.x = innerBounds.x + w;
					rect.y = innerBounds.y + h;
					break;
			}
		}

		protected function repaint() : void 
		{
			_background.x = outerBounds.x;
			_background.y = outerBounds.y;
			_background.graphics.clear();
			_background.graphics.beginFill(_backgroundColor, _backgroundAlpha);
			_background.graphics.drawRect(0, 0, outerBounds.width, outerBounds.height);
			_background.graphics.endFill();
		}
		
		public function setPadding(top : Number, right : Number, bottom : Number, left : Number) : void 
		{
			padding.setValues(top, right, bottom, left);
			
			onComponentResize(bounds.width, bounds.height);
		}
		
		private function handleTooltipForClippedText() : void 
		{
			if ((!_component.tooltipText || _component.tooltipText == "") && textIsDisplayedPartially())
			{
				const mx : Number = _component.displayObject.mouseX;
				const my : Number = _component.displayObject.mouseY;
				
//				var point : Point = new Point(mx, my);
//				var pointOffset : Point = NTooltipManager.tooltipOffset;
//				
//				point.x = point.x + pointOffset.x;
//				point.y = point.y + pointOffset.y;
//				
//				point = _component.displayObject.localToGlobal(point);
//				
//				NTooltipManager.showTooltipAt(_component.text, point.x, point.y);
			}
		}

		public function get textAlignment() : UIAlignment { return _textAlignment; }
		public function set textAlignment(value : UIAlignment) : void 
		{
			if (value != _textAlignment)
			{
				_textAlignment = value;
				
				switch(_textAlignment)
				{
					case UIAlignment.TOP_LEFT:
					case UIAlignment.CENTER_LEFT:
					case UIAlignment.BOTTOM_LEFT:
						_text.textAlign = UITextRenderer.ALIGN_LEFT;
						break;
						
					case UIAlignment.TOP_CENTER:
					case UIAlignment.CENTER_CENTER:
					case UIAlignment.BOTTOM_CENTER:
						_text.textAlign = UITextRenderer.ALIGN_CENTER;
						break;
						
					case UIAlignment.TOP_RIGHT:
					case UIAlignment.CENTER_RIGHT:
					case UIAlignment.BOTTOM_RIGHT:
						_text.textAlign = UITextRenderer.ALIGN_RIGHT;
						break;
				}
				
				updateTextRenderer();
				updatePositioning();
			}
		}

		public function get iconAlignment() : UIAlignment { return _iconAlignment; }
		public function set iconAlignment(value : UIAlignment) : void 
		{
			if (value != _iconAlignment)
			{
				_iconAlignment = value;
				
				updatePositioning();
			}
		}

		public function get iconTextSpace() : int { return _iconTextSpace; }
		public function set iconTextSpace(value : int) : void 
		{
			if (value != _iconTextSpace)
			{
				_iconTextSpace = value;
				
				updatePositioning();
			}
		}

		public function get fontSize() : int { return _textFormat.fontSize; }
		public function set fontSize(value : int) : void 
		{
			if (value != _textFormat.fontSize)
			{
				_textFormat.fontSize = value;
				
				updateTextRenderer(UPDATE_FONT_FORMAT);
			}
		}

		public function get fontColor() : int { return _textFormat.fontColor; }
		public function set fontColor(value : int) : void 
		{
			if (value != _textFormat.fontColor)
			{
				_textFormat.fontColor = value;
				
				updateTextRenderer(UPDATE_FONT_FORMAT);
			}
		}

		public function get italic() : Boolean { return _textFormat.italic; }
		public function set italic(value : Boolean) : void 
		{
			if (value != _textFormat.italic)
			{
				_textFormat.italic = value;
				
				updateTextRenderer(UPDATE_FONT_POSTURE);
			}
		}

		public function get bold() : Boolean { return _textFormat.bold; }
		public function set bold(value : Boolean) : void 
		{
			if (value != _textFormat.bold)
			{
				_textFormat.bold = value;
				updateTextRenderer(UPDATE_FONT_POSTURE);
			}
		}

		public function get lineSpacing() : int { return _text.lineSpacing; }
		public function set lineSpacing(value : int) : void 
		{
			if (value != _textFormat.lineSpacing)
			{
				_textFormat.lineSpacing = value;
				_text.lineSpacing = value;
				
				updateTextRenderer();
				updatePositioning();
			}
		}

		public function get autoEllipsis() : Boolean { return _text.autoEllipsis; }
		public function set autoEllipsis(value : Boolean) : void 
		{
			if (value != _text.autoEllipsis)
			{
				_text.autoEllipsis = value;
				
				updateTextRenderer();
			}
		}

		public function get bindIconToText() : Boolean { return _bindIconToText; }
		public function set bindIconToText(value : Boolean) : void 
		{
			if (_bindIconToText != value)
			{
				_bindIconToText = value;
				
				updatePositioning();
				updateTextRenderer();
			}
		}

		public function get backgroundColor() : int { return _backgroundColor; }
		public function set backgroundColor(value : int) : void 
		{
			if (value != _backgroundColor)
			{
				_backgroundColor = value;
				
				repaint();
			}
		}

		public function get backgroundAlpha() : Number { return _backgroundAlpha; }
		public function set backgroundAlpha(value : Number) : void 
		{
			if (value != _backgroundAlpha)
			{
				_backgroundAlpha = value;
				
				repaint();
			}
		}
		
		public function get textFormat() : UITextFormat { return _textFormat; }
		public function set textFormat(value : UITextFormat) : void 
		{
			if (value != _textFormat)
			{
				_textFormat = value;
				
				updateTextRenderer(UPDATE_FONT_ALL);
				updatePositioning();
				repaint();
			}
		}

		public function get breakOpportunity() : String { return _text.breakOpportunity; }
		public function set breakOpportunity(value : String) : void
		{
			_text.breakOpportunity = value;
			
			updateTextRenderer();
		}
		
		public function get lineHeight() : Number { return _text.lineHeight; }
		
		public function get textWidth() : Number { return _text.textWidth; }
		
		public function get textHeight() : Number { return _text.textHeight; }

		override public function dispose() : void 
		{
			if (_text)
			{
				if (_text.parent)
				{
					_text.parent.removeChild(_text);
				}
				_text.dispose();
				_text = null;
			}
			
			if (_icon)
			{
				if (_icon.parent)
				{
					_icon.parent.removeChild(_icon);
				}
				_icon = null;
			}
			
			if (_background)
			{
				if (_background.parent)
				{
					_background.parent.removeChild(_background);
				}
				_background = null;
			}
			
			super.dispose();
		}
	}
}
