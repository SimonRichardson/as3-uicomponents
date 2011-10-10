package org.osflash.ui.components.component
{
	import org.osflash.ui.geom.UIRectangle;
	import org.osflash.ui.signals.ISignalTarget;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IUIComponent extends ISignalTarget
	{
		
		function resizeTo(width : int, height : int) : void;
		
		function measure(measureResult : UIRectangle) : void;
		
		function get view() : IUIComponentView;
		function set view(value : IUIComponentView) : void;
		
		function get model() : IUIComponentModel;
		function set model(value : IUIComponentModel) : void;
		
		function get state() : IUIComponentState;
		function set state(value : IUIComponentState) : void;
		
		function get signalProxy() : IUIComponentSignalProxy;
		function set signalProxy(value : IUIComponentSignalProxy) : void;
		
		function get enabled() : Boolean;
		function set enabled(value : Boolean) : void;
		
		function get focused() : Boolean;
		function set focused(value : Boolean) : void;
				
		function get hovered() : Boolean;
		function set hovered(value : Boolean) : void;
		
		function get pressed() : Boolean;
		function set pressed(value : Boolean) : void;
		
		function get action() : int;
		function set action(value : int) : void;
		
		function get tabIndex() : int;
		function set tabIndex(value : int) : void;
		
		function get keyChar() : String;
		function set keyChar(value : String) : void;
		
		function get tooltipText() : String;
		function set tooltipText(value : String) : void;
	}
}
