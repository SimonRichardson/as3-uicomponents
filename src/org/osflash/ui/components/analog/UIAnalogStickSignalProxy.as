package org.osflash.ui.components.analog
{
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	import org.osflash.ui.components.component.UIComponentSignalProxy;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIAnalogStickSignalProxy extends UIComponentSignalProxy
	{
		
		/**
		 * The angle from the center
		 * @private
		 */
		private const _angle : ISignal = new Signal(Number);
		
		/**
		 * The distance from the center
		 * @private
		 */
		private const _distance : ISignal = new Signal(Number);
		
		public function get angle() : ISignal { return _angle; }
		
		public function get distance() : ISignal { return _distance; }
	}
}
