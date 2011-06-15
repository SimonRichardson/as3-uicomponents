package org.osflash.ui.components.component
{
	import org.osflash.ui.signals.ISignalTarget;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IUIComponent extends ISignalTarget
	{
		
		function get view() : IUIComponentView;
		function set view(value : IUIComponentView) : void;
		
		function get model() : IUIComponentModel;
		function set model(value : IUIComponentModel) : void;
	}
}
