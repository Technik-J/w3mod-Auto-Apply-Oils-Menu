class AutoApplyOils extends AutoApplyOilsFunctions
{
	public function Initialise()
	{
		var i : int;
		var maxEnemyByType : enemyStruct;
		var bossActor : CActor;
		var emptyActor : CActor;
		var bossActorArray : array<CActor>;
		var bossMonster : bool;
		var enableMod : bool;
		var enableBosses : bool;
		
		enableMod = theGame.GetInGameConfigWrapper().GetVarValue('aao_settings', 'val_enable_mod');
		enableBosses = theGame.GetInGameConfigWrapper().GetVarValue('aao_settings', 'val_enable_bosses');

		if (enableMod == false)
		{
			return;
		}
		super.Initialise();
		
		maxEnemyByType = GetEnemyMaxArrayOil(enemyArray,false);
		
		for( i=0; i<enemyArray.Size(); i+=1)
		{
			if (enemyArray[i].HasTag('HideHealthBarModule'))
			{
				bossActor = enemyArray[i];
			}
		}
		
		if (bossActor != emptyActor)
		{
			bossActorArray.PushBack(bossActor);
			bossMonster = true;
		}

		if (bossMonster == false)
		{
			AutoApplyOil(enemyArray);
		}
		else
		{
			if (enableBosses == true)
			{
				AutoApplyOil(bossActorArray, true);
			}
		}
		
		NotifyPlayer();
	}
}