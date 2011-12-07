package  
{
	/**
	 * ...
	 * @author Maxime
	 */
	public class Regle 
	{
		private var premices:Array;
		private var conclusion:Fait;
		
		public function Regle(ccl:Fait)
		{
			premices = new Array();
			conclusion = ccl;
		}
		
		public function addPremices(_premices:Fait):void {
			premices.push(_premices);
		}
		
		public function getConclusion() :Fait{
			return conclusion;
		}
		
		public function getPremices() :Array {
			return premices;
		}
		
		public function afficheRegle() :String{
			var affiche:String = "";
			for (var i:int = 0; i < premices.length; i++ ) {
				affiche += premices[i].getFaitId();
				affiche += " - "
			}
			
			affiche += "> ";
			affiche += conclusion.getFaitId();
			
			return affiche;
		}
	}

}