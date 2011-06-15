package org.osflash.ui.components.component
{
	import org.osflash.ui.signals.ISignalTarget;

	import flash.geom.Point;
	import org.osflash.ui.display.UISprite;
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
		
		public function UIComponent(view : IUIComponentView, model : IUIComponentModel)
		{
			this.view = view;
			this.model = model;
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
		 * @inheritDoc
		 */
		public function get view() : IUIComponentView { return _view; }
		public function set view(value : IUIComponentView) : void
		{
			if(null == view) throw new ArgumentError('IUIComponentView can not be null');
			
			if(_view == value) return;
			
			if(null != _view) _view.unbind();
			
			_view = value;
			_view.bind(this);
		}
		
		/**
		 * @inheritDoc
		 */
		public function get model() : IUIComponentModel { return _model; }
		public function set model(value : IUIComponentModel) : void
		{
			if(null == view) throw new ArgumentError('IUIComponentModel can not be null');
			
			if(_model == value) return;
			
			if(null != _model) _model.unbind();
			
			_model = value;
			
			if(view) _model.bind(this);
		}
		
		/**
		 * @inheritDoc
		 */
		public function get state() : IUIComponentState { return _state; }
		public function set state(value : IUIComponentState) : void
		{
			_state = value;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function set enabled(value : Boolean) : void
		{
			super.enabled = value;
			
			state.enabled = value;
		}
	}
}
