package org.osflash.ui.components.component
{
	import org.osflash.signals.ISignal;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IUIComponentSignalProxy
	{

		function get enabled() : ISignal;

		function get hovered() : ISignal;

		function get focused() : ISignal;

		function get pressed() : ISignal;
		
		function get action() : ISignal;
	}
}
