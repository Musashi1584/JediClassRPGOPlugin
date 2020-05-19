//-----------------------------------------------------------
//	Class:	X2Ability_RPGOJediClassPlugin
//	Author: Musashi
//	
//-----------------------------------------------------------
class X2Ability_RPGOJediClassPlugin extends X2Ability;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> AbilityTemplates;

	AbilityTemplates.AddItem(ForceUser());

	return AbilityTemplates;
}

static function X2AbilityTemplate ForceUser()
{
	local X2AbilityTemplate Template;
	
	Template = PurePassive('ForceUser', "img:///JediClassUI.UIPerk_ForceUser");
	Template.SoldierAbilityPurchasedFn = ForceUserPurchased;

	return Template;
}

static function ForceUserPurchased(XComGameState NewGameState, XComGameState_Unit UnitState)
{
	local float MaxStat, NewMaxStat, NewCurrentStat;
	local int Boost;
	
	Boost = 50;

	MaxStat = UnitState.GetMaxStat(eStat_PsiOffense);
	NewMaxStat = MaxStat + Boost;
	NewCurrentStat = int(UnitState.GetCurrentStat(eStat_PsiOffense)) + Boost;
	UnitState.SetBaseMaxStat(eStat_PsiOffense, NewMaxStat);
}