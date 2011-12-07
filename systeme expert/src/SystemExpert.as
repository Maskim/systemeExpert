package  
{
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.text.TextFieldAutoSize;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	/**
	 * ...
	 * @author Maxime
	 */
	public class SystemExpert extends Sprite
	{
		private var baseRegle:BaseRegle;
		private var baseFait:BaseFait;
		
		private var sprite:Sprite;
		
		private var vrai:TextField;
		
		private var vraiButton:SimpleButton;
		private var fauxButton:SimpleButton;
		
		public function SystemExpert() 
		{
			baseRegle = new BaseRegle();
			baseFait = new BaseFait();
			
			sprite = new Sprite();
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
		
		public function getSprite() :Sprite
		{
			return sprite;
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
			
			for (var i:int = 0; i < premicesDeBase.length; i++ )
			{
				demandeSiVrai(premicesDeBase[i]);
			}
		}
		
		private function demandeSiVrai(fait:Fait) :void{
			creationButton();
			
			
		}
		
		private function creationButton():void 
		{
			vrai = new TextField();
			
			vrai.text = "Vrai";
			
			
			var faux:TextField = new TextField();
			
			faux.text = "Faux";
			
			vrai.x = 100;
			vrai.y = 100;
			faux.x = 150;
			faux.y = 100;
			
			vrai.addEventListener(MouseEvent.CLICK, onClickTrue);
			faux.addEventListener(MouseEvent.CLICK, onClickFalse);
			
			sprite.addChild(vrai);
			sprite.addChild(faux);
		}
		
		public function onClickTrue(e:Event) :void{
			vrai.text = "je suis vrai";
		}
		
		public function onClickFalse(e:Event) :void{
			
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