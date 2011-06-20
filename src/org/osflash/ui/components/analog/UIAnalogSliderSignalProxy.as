package org.osflash.ui.components.analog
{
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	import org.osflash.ui.components.component.UIComponentSignalProxy;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIAnalogSliderSignalProxy extends UIComponentSignalProxy
	{
		
		/**
		 * The position of the slider as an percentage 0-1
		 * @private
		 */
		private const _position : ISignal = new Signal(Number);
		
		public function get position() : ISignal { return _position; }
	}
}
