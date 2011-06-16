package org.osflash.ui.components.component
{
	import org.osflash.ui.components.errors.AbstractMethodError;
	import org.osflash.ui.display.UISprite;
	import org.osflash.ui.signals.ISignalTarget;

	import flash.geom.Point;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIComponent extends UISprite implements IUIComponent
	{
		
		/**
		 * @private
		 */
		private var _view : IUIComponentView;
		
		/**
		 * @private
		 */
		private var _model : IUIComponentModel;
		
		/**
		 * @private
		 */
		private var _state : IUIComponentState;
		
		/**
		 * @private
		 */
		private var _proxy : IUIComponentSignalProxy;
		
		public function UIComponent(view : IUIComponentView)
		{
			initComponent(view);
		}
		
		/**
		 * @inheritDoc
		 */
		public function resizeTo(width : int, height : int) : void
		{
			if(null == view) return;
			
			width = width < 0 ? 0 : width;
			height = height < 0 ? 0 : height;
			
			if(width == view.bounds.width && height == view.bounds.height) return;
			
			view.resizeTo(width, height);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function captureTarget(point : Point) : ISignalTarget
		{
			if(null != _view) return _view.captureTarget(point);
			return super.captureTarget(point);
		}
		
		/**
		 * @private
		 */
		final protected function initComponent(view : IUIComponentView) : void
		{
			initModel();
			initState();
			initProxy();
			
			initView(view);
		}
		
		/**
		 * @private
		 */
		protected function initView(value : IUIComponentView) : void
		{
			if(null == value) throw new ArgumentError('IUIComponentView can not be null');
			view = value;
		}
		
		/**
		 * @private
		 */
		protected function initModel() : void
		{
			throw new AbstractMethodError();
		}
		
		/**
		 * @private
		 */
		protected function initState() : void
		{
			_state = new UIComponentState();
		}
		
		/**
		 * @private
		 */
		protected function initProxy() : void
		{
			throw new AbstractMethodError();
		}
				
		/**
		 * @inheritDoc
		 */
		public function get view() : IUIComponentView { return _view; }
		public function set view(value : IUIComponentView) : void
		{
			if(null == value) throw new ArgumentError('IUIComponentView can not be null');
			
			if(_view == value) return;
			
			if(null != _view) _view.unbind();
			
			_view = value;
			if(null != signalProxy) _view.bind(this);
		}
		
		/**
		 * @inheritDoc
		 */
		public function get model() : IUIComponentModel { return _model; }
		public function set model(value : IUIComponentModel) : void
		{
			if(null == value) throw new ArgumentError('IUIComponentModel can not be null');
			
			if(_model == value) return;
			
			if(null != _model) _model.unbind();
			
			_model = value;
			if(null != signalProxy) _model.bind(this);
		}
		
		/**
		 * @inheritDoc
		 */
		public function get state() : IUIComponentState { return _state; }
		public function set state(value : IUIComponentState) : void
		{
			if(null == value) throw new ArgumentError('IUIComponentState can not be null');
			
			if(_state == value) return;
			
			if(null != _state) _state.unbind();
			
			_state = value;
			if(null != signalProxy) _state.bind(this);
		}
		
		/**
		 * @inheritDoc
		 */
		public function get signalProxy() : IUIComponentSignalProxy { return _proxy; }
		public function set signalProxy(value : IUIComponentSignalProxy) : void
		{
			if(null == value) throw new ArgumentError('IUIComponentSignalProxy can not be null');
			
			if(_proxy == value) return;
			
			if(null != view) _view.unbind();
			if(null != model) _model.unbind();
			if(null != state) _state.unbind();
			
			_proxy = value;
			
			if(null != view) _view.bind(this);
			if(null != model) _model.bind(this);
			if(null != state) _state.bind(this);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get width() : int { return _view.bounds.width; }
		override public function set width(value : int) : void { resizeTo(value, height); }
		
		/**
		 * @inheritDoc
		 */
		override public function get height() : int { return _view.bounds.height; }
		override public function set height(value : int) : void { resizeTo(width, value); }
		
		/**
		 * @inheritDoc
		 */
		override public function set enabled(value : Boolean) : void
		{
			super.enabled = value;
			
			state.enabled = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get focused() : Boolean { return state.focused; }
		public function set focused(value : Boolean) : void { state.focused = value; }
				
		/**
		 * @inheritDoc
		 */
		public function get hovered() : Boolean { return state.hovered; }
		public function set hovered(value : Boolean) : void { state.hovered = value; }
		
		/**
		 * @inheritDoc
		 */
		public function get pressed() : Boolean { return state.pressed; }
		public function set pressed(value : Boolean) : void { state.pressed = value; }
		
		/**
		 * @inheritDoc
		 */
		public function get tabIndex() : int { return model.tabIndex; }
		public function set tabIndex(value : int) : void { model.tabIndex = value; }
		
		/**
		 * @inheritDoc
		 */
		public function get keyChar() : String { return model.keyChar; }
		public function set keyChar(value : String) : void { model.keyChar = value; }
		
	}
}
