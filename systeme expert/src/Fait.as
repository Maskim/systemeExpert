package  
{
	/**
	 * ...
	 * @author Maxime
	 */
	public class Fait 
	{
		private var faitId:String;
		private var etat:Boolean;
		
		public function Fait(_fait:String) 
		{
			faitId = _fait;
			etat = false;
		}
		
		public function estVrai() :Boolean{
			return etat;
		}
		
		public function estFaux() :Boolean {
			if (etat == true)
				return false;
			else
				return true;
		}
		
		public function devientVrai() :void{
			etat = true;
		}
		
		public function getFaitId() :String {
			return faitId;
		}
	}

}