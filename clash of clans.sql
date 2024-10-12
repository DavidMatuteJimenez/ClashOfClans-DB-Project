-- Troops --
create table Troops (
	TroopID			int not null,
	TroopName 		text,
	MovementSpeed	int,
	DamageType 		text,
	Targets 		text,
	FavoriteTargets	text,
	primary key(TroopID)
);

-- Heros -- 
create table Heros (
	HeroID			int not null,
	HeroName		text,
	MovementSpeed	int,
	DamageType 		text,
	Targets			text,
	FavoriteTargets text,
	MaxDPS			int,
	primary key(HeroID)
);


--spells--
create table Spells (
	SpellID			int not null,
	SpellName		text,
	DamageType		text,
	Target			text,
	SpellDurationSec int,
	FavTarget		text,		
	primary key(SpellID)
);

--ElixerTroops--
create table ElixirTroops (
	TroopID			int not null references Troops(TroopID),
	BrracksLvlReq	text,
	primary key(TroopID)	
);

--DarkElixirTroops--
create table DarkElixirTroops (
	TroopID			int not null references Troops(TroopID),
	BrracksLvlReq	text,
	primary key(TroopID)	
);

--TrainingTroops--
create table TrainingTroops (
	TroopID			int not null references Troops(TroopID),
	TrainingTimeSec	int,
	HousingSpace	int,
	primary key(TroopID)
);

--SpecialAbility-- 
create table SpecialAbility (
	HeroID			int not null references Heros(HeroID),
	Name			text,
	primary key(HeroID)
);

--ElixirSpell--
create table ElixirSpell (
	SpellID 		int not null references Spells(SpellID),
	FactoryLvlReq	text,
	primary key(SpellID)
);

--DarkElixirSpell--
create table DarkElixirSpell (
	SpellID 		int not null references Spells(SpellID),
	FactoryLvlReq	text,
	primary key(SpellID)
);

-- Brewing Spells --
create table BrewingSpells (
	SpellID			int not null references Spells(SpellID),
	BrewingTimeSec	int,
	BrewingSpace	int,
	primary key(SpellID)
	
);

--SpellUpgrades--
create table SpellUpgrades (
	SpellID				int not null references Spells(SpellID),
	MaxUpgradeECost		int,
	MaxUpgradeDECost	int,
	MaxSpellLvl			int,
	MaxUpgradeTime		int,
	MaxDPS				int,
	primary key(SpellID)
);

--TroopUpgrades--
create table TroopUpgrades (
	TroopID				int not null references Troops(TroopID),
	MinHP				int,
	MaxHP				int,
	MaxUpgradeECost		int,
	MaxUpgradeDECost	int,
	MaxUpgradeTime		int,
	MaxTroopLvl			int,
	MaxDPS				int,
	primary key(TroopID)
);

--ArmyCamp--
create table ArmyCamp(
	ArmyCampID		int not null,
	TroopID			int not null references Troops(TroopID),
	HeroID			int not null references Heros(HeroID),
	SpellID			int not null references Spells(SpellID),
	ElixirType		text,
	primary key(ArmyCampID)
);

-- Troops -- 
insert into Troops (TroopID, TroopName, MovementSpeed, DamageType, Targets, FavoriteTargets)
values 
(1, 'Barbarian', 16, 'Single Target', 'Ground', 'None'),
(2, 'Archer', 24, 'Single Target', 'Air & Ground', 'None'),
(3, 'Giant', 12, 'Single Target', 'Ground', 'Defense'),
(4, 'Wizard', 16, 'Splash Damage', 'Ground & Air', 'None'),
(5, 'Goblin', 32, 'Single Target', 'Resources', 'None'),
(6, 'Balloon', 10, 'Splash Damage', 'Ground & Air', 'Defense'),
(7, 'Dragon', 12, 'Splash Damage', 'Ground & Air', 'None'),
(8, 'P.E.K.K.A', 16, 'Single Target', 'Ground', 'Defense'),
(9, 'Minion', 32, 'Single Target', 'Air', 'None'),
(10, 'Hog Rider', 24, 'Single Target', 'Ground', 'Defense'),
(11, 'Valkyrie', 24, 'Splash Damage', 'Ground', 'None'),
(12, 'Golem', 12, 'Single Target', 'Ground', 'Defense'),
(13, 'Bowler', 14, 'Area Splash', 'Ground', 'None'),
(14, 'Ice Golem', 15, 'Single Target', 'Ground', 'Defenses'),
(15, 'Witch', 12, 'Area Splash', 'Ground & Air', 'None' );

--Spells--
insert into Spells (SpellID, SpellName, DamageType, Target, SpellDurationSec, FavTarget)
values 
(1, 'Lightning Spell', 'Splash Damage', 'Ground & Air', 0, 'None' ),
(2, 'Healing Spell', 'Heal', 'Ground & Air', 10, 'Troops & Heros'),
(3, 'Rage Spell', 'Buff', 'Ground & Air', 30, 'Troops & Heros'),
(4, 'Freeze Spell', 'Disable', 'Ground & Air', 4, ' None'),
(5, 'Jump Spell', 'Movement', 'Ground', 30, 'Walls'),
(6, 'Clone Spell', 'Summon', 'Ground & Air',  20, 'Troops'),
(7, 'Invisibility Spell', 'Buff', 'Ground & Air', 7, 'Troops & Heros'),
(8, 'Recall Spell', 'Redeployment', 'Ground & Air', 0, 'None'),
(9, 'Poison Spell', 'Damage over Time', 'Ground', 10, 'Troops & Heros'),
(10, 'Earthquake', 'Area Splash', 'Ground', 0, 'Walls' ),
(11, 'Haste Spell', 'Area Splash', 'Ground & Air', 30, 'none' ),
(12, 'Skeleton Spell', 'Area Splash', 'Ground', 0, 'None'),
(13, 'Bat Spell', 'Area Splash', 'Air', 0, 'Defenses'),
(14, 'Overgrowth Spell', 'Area Splash', 'Ground & Air', 28, 'None');

--Elixir Troops --
insert into ElixirTroops (TroopID, BrracksLvlReq)
values 
(1, '1'), 
(2, '2'),
(3, '3'),
(4, '7'),
(5, '4'),
(6, '6'),
(7, '9')
(8, '10');

-- Dark Elixir Troops --
insert into DarkElixirTroops (TroopID, BrracksLvlReq)
values 
(9, '1'), 
(10, '2'),
(11, '3'),
(12, '4'),
(13, '7'),
(14, '8'),
(15, '5');

-- Elixir Spells --
insert into ElixirSpell (SpellID, FactoryLvlReq)
values 
(1, '1'), 
(2, '2'),
(3, '3'),
(4, '4'),
(5, '4'),
(6, '5'),
(7, '6'),
(8, '7');

-- Dark Elixir Spells --
insert into DarkElixirSpell (SpellID, FactoryLvlReq)
values 
(9, '1'), 
(10, '2'),
(11, '3'),
(12, '4'),
(13, '5'),
(14, '6');

-- Heros --
insert into Heros (HeroID, HeroName, MovementSpeed, DamageType, Targets, FavoriteTargets, MaxDPS)
values 
(1, 'Barbarian King', 16, 'Single Target', 'Ground', 'None', 608),
(2, 'Archer Queen', 24, 'Single Target', 'Ground & Air', 'None', 765),
(3, 'Grand Warden', 16, 'Single Target', 'Ground & Air', 'None', 309),
(4, 'Royal Champion', 24, 'Splash Damage', 'Ground & Air', 'Defenses', 545);

-- Hero Special Ability --
insert into SpecialAbility (HeroID, Name)
values 
(1, 'Iron Fist'), 
(2, 'Royal Cloak'),
(3, 'Eternal Tome'),
(4, 'Royal Cloak');

--TrainingTroops--
insert into TrainingTroops (TroopID, TrainingTimeSec, HousingSpace)
values 
(1, 5, 1),   -- Barbarian
(2, 6, 1),   -- Archer
(3, 30, 5),  -- Giant
(4, 30, 5),  -- Wizard
(5, 7, 1),   -- Goblin
(6, 30, 5),  -- Balloon
(7, 180, 20), -- Dragon
(8, 180, 25), -- P.E.K.K.A
(9, 18, 2),   -- Minion
(10, 45, 5), -- Hog Rider
(11, 90, 8), -- Valkyrie
(12, 300, 30),-- Golem
(13, 60, 6), -- Bowler
(14, 150, 15),-- Ice Golem
(15, 120, 12);-- Witch

--TroopUpgrades--
insert into TroopUpgrades (TroopID, MinHP, MaxHP, MaxUpgradeECost, MaxUpgradeDECost, MaxUpgradeTime, MaxTroopLvl, MaxDPS)
values
(1, 45, 290, 18000000, 0, 13, 12, 48),    -- Barbarian
(2, 20, 68, 18000000, 0, 13, 12, 40),     -- Archer
(3, 300,2400, 18500000, 0, 14, 12, 94),-- Giant
(4, 75, 290, 19200000, 0, 14, 12, 275),    -- Wizard
(5, 22, 146, 16000000, 0, 14, 9, 72),     -- Goblin
(6, 150, 1140, 20000000, 0, 16, 11, 290),  -- Balloon
(7, 1900, 5300, 21500000, 0, 16, 11, 390), -- Dragon
(8, 3000, 7700, 20500000, 0, 14, 11, 810), -- P.E.K.K.A
(9, 58, 120, 0, 320000, 14, 12, 78),      -- Minion
(10, 270, 1380, 0, 350000, 15, 13, 213),-- Hog Rider
(11, 750, 2800, 0, 340000, 15, 11, 238),-- Valkyrie
(12, 5100, 9200, 0, 350000, 15, 13, 95),-- Golem
(13, 325, 600, 0, 350000, 15, 8, 126), -- Bowler
(14, 2600, 4200, 0, 360000, 16, 8, 200), -- Ice Golem
(15, 300, 560, 0, 360000, 16, 7, 220); -- Witch

--SpellUpgrades--
insert into SpellUpgrades (SpellID, MaxUpgradeECost, MaxUpgradeDECost, MaxSpellLvl, MaxUpgradeTime, MaxDPS)
values 
(1, 900000, 0, 8, 11, 150),    -- Lightning Spell
(2, 1000000, 0, 8, 11, 0),      -- Healing Spell
(3, 1200000, 0, 8, 11, 0),      -- Rage Spell
(4, 1300000, 0, 8, 10, 0),      -- Freeze Spell
(5, 1400000, 0, 8, 12, 0),      -- Jump Spell
(6, 1500000, 0, 8, 12, 0),      -- Clone Spell
(7, 1600000, 0, 8, 13, 0),      -- Invisibility Spell
(8, 1700000, 0, 8, 10, 0),      -- Recall Spell
(9, 0, 200000, 8, 9, 200),      -- Poison Spell
(10, 0, 220000, 7, 12, 400),     -- Earthquake
(11, 0, 280000, 7, 8, 0),     -- Haste Spell
(12, 0, 260000, 7, 8, 0),     -- Skeleton Spell
(13, 0, 260000, 7, 11, 0),     -- Bat Spell
(14, 0, 300000, 4, 10, 0);     -- Overgrowth Spell

-- Brewing Spells --
insert into BrewingSpells (SpellID, BrewingTimeSec, BrewingSpace)
values
(1, 180, 1),   -- Lightning Spell
(2, 240, 2),   -- Healing Spell
(3, 3000, 2),   -- Rage Spell
(4, 180, 1),   -- Freeze Spell
(5, 240, 2),   -- Jump Spell
(6, 360, 3),   -- Clone Spell
(7, 360, 1),   -- Invisibility Spell
(8, 360, 2),   -- Recall Spell
(9, 120, 1),   -- Poison Spell
(10, 120, 1),  -- Earthquake
(11, 100, 1),  -- Haste Spell
(12, 120, 1),  -- Skeleton Spell
(13, 120, 1),  -- Bat Spell
(14, 300, 2);  -- Overgrowth Spell


insert into ArmyCamp (ArmyCampID, TroopID, HeroID, SpellID, ElixirType)
values
(1, 1, 1, 1, 'Elixir & Dark Elixir'),    -- Barbarian, Barbarian King, Lightning Spell
(2, 2, 2, 2, 'Elixir & Dark Elixir'),    -- Archer, Archer Queen, Healing Spell
(3, 3, 3, 3, 'Elixir'),    -- Giant, Grand Warden, Rage Spell
(4, 4, 4, 4, 'Elixir & Dark Elixir'),    -- Wizard, Royal Champion, Freeze Spell
(5, 5, 1, 5, 'Elixir & Dark Elixir'),    -- Goblin, Barbarian King, Jump Spell
(6, 6, 3, 6, 'Elixir');    -- Balloon, Grand Warden, Clone Spell


--VIEWS--

--ArmyComposition--
create view ArmyComposition as
select ac.ArmyCampID, t.TroopName, h.HeroName, s.SpellName, ac.ElixirType
from ArmyCamp ac
join Troops t on ac.TroopID = t.TroopID
join Heros h on ac.HeroID = h.HeroID
join Spells s on ac.SpellID = s.SpellID;

select * 
from ArmyComposition;

--HeroDetails--
create view HeroDetails as
select Heros.*, SpecialAbility.Name as SpecialAbilityName
from Heros
inner join SpecialAbility on Heros.HeroID = SpecialAbility.HeroID;

select *
from HeroDetails;

--TrainingAndBrewing--
create TrainingAndBrewing as
select 'Training Troop' as type,
       TrainingTroops.TroopID as identification,
       Troops.TroopName as Name,
       TrainingTimeSec as DurationInSeconds
from TrainingTroops
join Troops on TrainingTroops.TroopID = Troops.TroopID
union all
select 'Brewing Spell' as type,
       BrewingSpells.SpellID as identification,
       Spells.SpellName as Name,
       BrewingTimeSec as DurationInSeconds
from BrewingSpells
join Spells on BrewingSpells.SpellID = Spells.SpellID
order by DurationInSeconds asc;

select *
from TrainingAndBrewing;

--Spell Details--
create SpellDetails as
select Spells.SpellID as SpellID, Spells.SpellName, Spells.DamageType, Spells.Target, 
Spells.SpellDurationSec, Spells.FavTarget,SpellUpgrades.MaxUpgradeECost, SpellUpgrades.MaxUpgradeDECost, 
SpellUpgrades.MaxSpellLvl, SpellUpgrades.MaxUpgradeTime, SpellUpgrades.MaxDPS
from Spells
inner join SpellUpgrades on Spells.SpellID = SpellUpgrades.SpellID;

select * 
from spellDetails;

--Reports--
select Troops.TroopName, TroopUpgrades.MaxUpgradeECost, TroopUpgrades.MaxUpgradeDECost
from Troops
join TroopUpgrades on Troops.TroopID = TroopUpgrades.TroopID;

select Troops.TroopName, TroopUpgrades.MaxDPS
from Troops
join TroopUpgrades on Troops.TroopID = TroopUpgrades.TroopID
order by TroopUpgrades.MaxDPS asc;

select Heros.HeroName, Heros.MaxDPS, SpecialAbility.Name as SpecialAbility
from Heros
join SpecialAbility on Heros.HeroID = SpecialAbility.HeroID
order by Heros.MaxDPS desc
limit 1;

select Spells.SpellName, Spells.SpellDurationSec, Spells.FavTarget
from Spells
where Spells.SpellDurationSec = (
    select max(SpellDurationSec)
    from Spells
)
limit 1;

--stored procedures--
create or replace function GetTroopInfo(p_TroopID int)
returns table(
    TroopID int,
    TroopName text,
    MovementSpeed int,
    DamageType text,
    Targets text,
    FavoriteTargets text
) as
$$
begin
    return query
    select Troops.TroopID, Troops.TroopName, Troops.MovementSpeed, Troops.DamageType, Troops.Targets, Troops.FavoriteTargets
    from Troops
    where Troops.TroopID = p_TroopID;
end;
$$
language plpgsql;

select *
from GetTroopInfo(6);


--GetSpellInfo--
create or replace function GetSpellInfo(p_SpellID int)
returns table (
    SpellID int,
    SpellName text,
    DamageType text,
    Target text,
    SpellDurationSec int,
    FavTarget text
) as $$
begin
    return query
    select Spells.SpellID, Spells.SpellName, Spells.DamageType, Spells.Target, Spells.SpellDurationSec, Spells.FavTarget
    from Spells
    where Spells.SpellID = p_SpellID;
end;
$$ lanaguage plpgsql;

select *
from GetSpellInfo(6);

--GetHeroInfo--
create or replace function GetHeroInfo(p_HeroID int)
returns table (
    HeroID int,
    HeroName text,
    MovementSpeed int,
    DamageType text,
    Targets text,
    FavoriteTargets text,
    MaxDPS int
) as $$
begin
    return query
    select Heros.HeroID, Heros.HeroName, Heros.MovementSpeed, Heros.DamageType, Heros.Targets, Heros.FavoriteTargets, Heros.MaxDPS
    from Heros
    where Heros.HeroID = p_HeroID;
end;
$$ language plpgsql;

select * from GetHeroInfo(2);

--GetArmyCampInfo--
create or replace function GetArmyCampInfo(p_ArmyCampID int)
returns table (
    ArmyCampID int,
    TroopID int,
    TroopName text,
    HeroID int,
    HeroName text,
    SpellID int,
    SpellName text,
    ElixirType text
) as $$
begin
    return query
    select 
        ArmyCamp.ArmyCampID, 
        ArmyCamp.TroopID, 
        Troops.TroopName, 
        ArmyCamp.HeroID, 
        Heros.HeroName, 
        ArmyCamp.SpellID, 
        Spells.SpellName, 
        ArmyCamp.ElixirType
    from 
        ArmyCamp
    left join 
        Troops on ArmyCamp.TroopID = Troops.TroopID
    left join 
        Heros on ArmyCamp.HeroID = Heros.HeroID
    left join 
        Spells on ArmyCamp.SpellID = Spells.SpellID
    where 
        ArmyCamp.ArmyCampID = p_ArmyCampID;
end;
$$ language plpgsql;

select * from GetArmyCampInfo(3);


--TRIGGER--
--ensure MovementSpeed is positive.
create or replace function validate_movement_speed()
returns trigger as
$$
begin
    if new.MovementSpeed <= 0 then
        raise exception 'Movement speed must be positive';
    end if;
    return new;
end;
$$ language plpgsql;

create trigger validate_movement_speed_trigger
before insert or update Troops
for each row execute function validate_movement_speed();

--positive MovementSpeed--
insert into Troops (TroopID, TroopName, MovementSpeed, DamageType, Targets, FavoriteTargets)
values (16, 'New Troop', 10, 'Single Target', 'Ground', 'None');

--non-positive MovementSpeed--
insert into Troops (TroopID, TroopName, MovementSpeed, DamageType, Targets, FavoriteTargets)
values (17, 'Another Troop', -5, 'Single Target', 'Ground', 'None');

--SECURITY--
create role player;
grant all
on all tables in schema public
to player;

-- SQL statements for displaying this example data: --
select *
from troops;

select *
from spells;

select *
from ElixirTroops;

select *
from DarkElixirTroops;

select *
from ElixirSpell;

select *
from DarkElixirSpell;

select *
from Heros;

select *
from SpecialAbility;

select *
from TrainingTroops;

select *
from TroopUpgrades;

select * 
from SpellUpgrades;

select * 
from BrewingSpells;

select *
from ArmyCamp;



