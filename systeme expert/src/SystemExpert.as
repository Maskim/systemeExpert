package  
{
	/**
	 * ...
	 * @author Maxime
	 */
	public class SystemExpert 
	{
		private var baseRegle:BaseRegle;
		private var baseFait:BaseFait;
		
		public function SystemExpert() 
		{
			baseRegle = new BaseRegle();
			baseFait = new BaseFait();
		}
		
		public function addRegle(premices:Array, ccl:String) :void{
			if (notExist(ccl))
				baseFait.addFait(new Fait(ccl));
			
			var regle:Regle = new Regle(baseFait.getFait(ccl));
				
			for (var i:int = 0; i < premices.length; i++ )
			{
				if ( notExist(premices[i]) )
				{
					baseFait.addFait(new Fait(premices[i]));
				}
				
				regle.addPremices(baseFait.getFait(premices[i]));
			}
			
			baseRegle.addRegle(regle);
		}
		
		public function chainageAvant() :void {
			while ( uneConclusionFausse() ) {
				var reglesFausse:Array = ConclusionFausse();
				
				for (var j:int = 0; j < reglesFausse.length; j++ )
				{					
					var k:int;
					var premices:Array = reglesFausse[j].getPremices();
					var regleConfirmee:Boolean;
					for (k = 0; k < premices.length; k++ ) {
						if (premices[k].estVrai()) {
							regleConfirmee = true;
						}else {
							regleConfirmee = false;
						}
					}
					
					if (regleConfirmee)
					{
						reglesFausse[j].getConclusion().devientVrai();
						trace( reglesFausse[j].afficheRegle() );
					}
				}
			}
		}
		
		public function chainageArriere():void
		{
			var premicesDeBase:Array = PremicesDeBase();
			
			
		}
		
		private function PremicesDeBase():Array
		{
			var PremicesDeBase:Array = baseRegle.getFirstPremices();
			trace ("les premices de base");
			
			for (var i:int = 0 ; i < PremicesDeBase.length; i++ )
			{
				trace(PremicesDeBase[i].getFaitId());
			}
			
			return PremicesDeBase;
		}
		
		private function uneConclusionFausse() :Boolean{
			var cclFausse:Boolean = false;
			
			for (var i:int = 0; i < baseRegle.getRegles().length; i++ )
			{
				if ( baseRegle.getRegle(i).getConclusion().estFaux())
				{
					cclFausse = true;
					break;
				}
			}
			
			return cclFausse;
		}
		
		private function ConclusionFausse() :Array{
			var regleprov:Array = new Array();
			for (var i:int = 0; i < baseRegle.getRegles().length; i++ )
			{
				if ( baseRegle.getRegle(i).getConclusion().estFaux())
				{
					regleprov.push(baseRegle.getRegle(i));
				}
			}
			return regleprov;
		}
		
		private function notExist(faitId:String) :Boolean{
			if ( baseFait.existe(faitId) )
				return false;
			else
				return true;
		}
		
		public function devenirVrai(faitId:String) :void{
			baseFait.getFait(faitId).devientVrai();
		}
	}

}