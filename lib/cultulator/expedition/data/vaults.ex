###                                        ###
### AUTOMATICALLY GENERATED.  DO NOT EDIT. ###
###                                        ###

defmodule Cultulator.Expedition.Data.Vaults do
  alias Cultulator.Expedition.Vault
  alias Cultulator.Expedition.Data.Hazards

  @vaults [
    %Vault{
      name: "Strathcoyne's Residence",
      card_id: "vaultcapital1",
      history_level: 2,
      hazards: [
        Hazards.get(:guardian_watchers)
      ]
    },
    %Vault{
      name: "Forgotten Mithraeum",
      card_id: "vaultcapital2",
      history_level: 2,
      hazards: [
        Hazards.get(:seal_hiddendoor)
      ]
    },
    %Vault{
      name: "Cater & Hero Limited",
      card_id: "vaultcapital3",
      history_level: 2,
      hazards: [
        Hazards.get(:peril_treacherousground)
      ]
    },
    %Vault{
      name: "St Agnes Hospital",
      card_id: "vaultcapital4",
      history_level: 2,
      hazards: [
        Hazards.get(:curse_dread)
      ]
    },
    %Vault{
      name: "Congregation of St Felix of Schüren",
      card_id: "vaultcapital5",
      history_level: 2,
      hazards: [
        Hazards.get(:guardian_monks)
      ]
    },
    %Vault{
      name: "Forsaken Reach",
      card_id: "vaultcapitaldefault",
      repeatable: true,
      history_level: 2,
      hazards: [
        Hazards.get(:guardian_watchers),
        Hazards.get(:peril_treacherousground)
      ]
    },
    %Vault{
      name: "Gladwyn Lake",
      card_id: "vaultshires1",
      history_level: 4,
      hazards: [
        Hazards.get(:guardian_serpent)
      ]
    },
    %Vault{
      name: "Lockwood Fen",
      card_id: "vaultshires2",
      history_level: 4,
      hazards: [
        Hazards.get(:guardian_watchers),
        Hazards.get(:peril_treacherousground)
      ]
    },
    %Vault{
      name: "Crowkiss Hill",
      card_id: "vaultshires3",
      history_level: 4,
      hazards: [
        Hazards.get(:seal_wardeddoor)
      ]
    },
    %Vault{
      name: "Keglin's Scratch",
      card_id: "vaultshires4",
      history_level: 4,
      hazards: [
        Hazards.get(:guardian_dead),
        Hazards.get(:peril_treacherousground)
      ]
    },
    %Vault{
      name: "Gwaer Inn",
      card_id: "vaultshires5",
      history_level: 4,
      hazards: [
        Hazards.get(:guardian_watchers),
        Hazards.get(:seal_wardeddoor)
      ]
    },
    %Vault{
      name: "Kerisham",
      card_id: "vaultshiresdefault",
      repeatable: true,
      history_level: 4,
      hazards: [
        Hazards.get(:curse_visions),
        Hazards.get(:guardian_watchers),
        Hazards.get(:seal_wardeddoor)
      ]
    },
    %Vault{
      name: "Chateau Raveline",
      card_id: "vaultcontinent1",
      history_level: 6,
      hazards: [
        Hazards.get(:curse_dread),
        Hazards.get(:seal_hiddendoor)
      ]
    },
    %Vault{
      name: "Fermier Abbey",
      card_id: "vaultcontinent2",
      history_level: 6,
      hazards: [
        Hazards.get(:guardian_monks),
        Hazards.get(:peril_forest)
      ]
    },
    %Vault{
      name: "Orthos Wood",
      card_id: "vaultcontinent3",
      history_level: 6,
      hazards: [
        Hazards.get(:guardian_watchers),
        Hazards.get(:peril_forest)
      ]
    },
    %Vault{
      name: "Vanderschaaf Collection",
      card_id: "vaultcontinent4",
      history_level: 6,
      hazards: [
        Hazards.get(:curse_visions),
        Hazards.get(:seal_wardeddoor)
      ]
    },
    %Vault{
      name: "Forman House",
      card_id: "vaultcontinent5",
      history_level: 6,
      hazards: [
        Hazards.get(:curse_dread),
        Hazards.get(:guardian_dead)
      ]
    },
    %Vault{
      name: "Key-Hunter's Garret",
      card_id: "vaultcontinent6",
      history_level: 6,
      hazards: [
        Hazards.get(:guardian_serpent),
        Hazards.get(:seal_hiddendoor)
      ]
    },
    %Vault{
      name: " Unnumbered Stones",
      card_id: "vaultcontinentdefault",
      repeatable: true,
      history_level: 6,
      hazards: [
        Hazards.get(:guardian_watchers),
        Hazards.get(:peril_forest),
        Hazards.get(:seal_hiddendoor)
      ]
    },
    %Vault{
      name: "Cave of Candles",
      card_id: "vaultlandbeyondforest1",
      history_level: 8,
      hazards: [
        Hazards.get(:guardian_serpent),
        Hazards.get(:peril_mountains)
      ]
    },
    %Vault{
      name: "Voivode's Citadel",
      card_id: "vaultlandbeyondforest2",
      history_level: 8,
      hazards: [
        Hazards.get(:guardian_dead),
        Hazards.get(:seal_hiddendoor)
      ]
    },
    %Vault{
      name: "Grunewald's Permanent Circus",
      card_id: "vaultlandbeyondforest3",
      history_level: 8,
      hazards: [
        Hazards.get(:curse_nowhere),
        Hazards.get(:guardian_watchers)
      ]
    },
    %Vault{
      name: "Tower Revek",
      card_id: "vaultlandbeyondforest4",
      history_level: 8,
      hazards: [
        Hazards.get(:curse_affliction),
        Hazards.get(:seal_hiddendoor)
      ]
    },
    %Vault{
      name: "Kusnetsov Endowment",
      card_id: "vaultlandbeyondforest5",
      history_level: 8,
      hazards: [
        Hazards.get(:guardian_watchers),
        Hazards.get(:peril_treacherousground),
        Hazards.get(:seal_hiddendoor)
      ]
    },
    %Vault{
      name: "Foxlily Meadows",
      card_id: "vaultlandbeyondforestdefault",
      repeatable: true,
      history_level: 8,
      hazards: [
        Hazards.get(:curse_visions),
        Hazards.get(:guardian_watchers),
        Hazards.get(:peril_mountains)
      ]
    },
    %Vault{
      name: "Hunter's Pits",
      card_id: "vaultrendingmountains1",
      history_level: 10,
      hazards: [
        Hazards.get(:guardian_serpent),
        Hazards.get(:guardian_watchers),
        Hazards.get(:peril_mountains)
      ]
    },
    %Vault{
      name: "Snow's Keeper",
      card_id: "vaultrendingmountains2",
      history_level: 10,
      hazards: [
        Hazards.get(:curse_nowhere),
        Hazards.get(:guardian_dead),
        Hazards.get(:peril_mountains)
      ]
    },
    %Vault{
      name: "Eye of Ikirmawi",
      card_id: "vaultrendingmountains3",
      history_level: 10,
      hazards: [
        Hazards.get(:curse_visions),
        Hazards.get(:peril_mountains),
        Hazards.get(:seal_wardeddoor)
      ]
    },
    %Vault{
      name: "Mausoleum of Wolves",
      card_id: "vaultrendingmountains4",
      history_level: 10,
      hazards: [
        Hazards.get(:guardian_dead),
        Hazards.get(:peril_mountains),
        Hazards.get(:seal_wardeddoor)
      ]
    },
    %Vault{
      name: "Tombs of the Shadowless Kings",
      card_id: "vaultrendingmountainsdefault",
      repeatable: true,
      history_level: 10,
      hazards: [
        Hazards.get(:curse_affliction),
        Hazards.get(:guardian_watchers),
        Hazards.get(:peril_mountains),
        Hazards.get(:seal_hiddendoor)
      ]
    },
    %Vault{
      name: "Star-Shattered Fane",
      card_id: "vaultloneandlevelsands1",
      history_level: 12,
      hazards: [
        Hazards.get(:curse_visions),
        Hazards.get(:peril_desert),
        Hazards.get(:seal_hiddendoor)
      ]
    },
    %Vault{
      name: "Lagun's Tomb",
      card_id: "vaultloneandlevelsands2",
      history_level: 12,
      hazards: [
        Hazards.get(:curse_dread),
        Hazards.get(:peril_desert),
        Hazards.get(:seal_wardeddoor)
      ]
    },
    %Vault{
      name: "Messana",
      card_id: "vaultloneandlevelsands3",
      history_level: 12,
      hazards: [
        Hazards.get(:curse_affliction),
        Hazards.get(:guardian_watchers),
        Hazards.get(:peril_desert)
      ]
    },
    %Vault{
      name: "Temple of Seven Coils",
      card_id: "vaultloneandlevelsands4",
      history_level: 12,
      hazards: [
        Hazards.get(:curse_nowhere),
        Hazards.get(:peril_desert),
        Hazards.get(:seal_wardeddoor)
      ]
    },
    %Vault{
      name: "Miah",
      card_id: "vaultloneandlevelsandsdefault",
      repeatable: true,
      history_level: 12,
      hazards: [
        Hazards.get(:curse_affliction),
        Hazards.get(:guardian_dead),
        Hazards.get(:peril_desert),
        Hazards.get(:seal_hiddendoor)
      ]
    },
    %Vault{
      name: "Raven Isle",
      card_id: "vaulteveningisles1",
      history_level: 14,
      hazards: [
        Hazards.get(:curse_visions),
        Hazards.get(:guardian_soucouyants),
        Hazards.get(:peril_sea)
      ]
    },
    %Vault{
      name: "Fort Geryk",
      card_id: "vaulteveningisles2",
      history_level: 14,
      hazards: [
        Hazards.get(:guardian_dead),
        Hazards.get(:peril_sea),
        Hazards.get(:seal_wardeddoor)
      ]
    },
    %Vault{
      name: "Wreck of the Christabel",
      card_id: "vaulteveningisles3",
      history_level: 14,
      hazards: [
        Hazards.get(:curse_affliction),
        Hazards.get(:guardian_serpent),
        Hazards.get(:peril_sea)
      ]
    },
    %Vault{
      name: "St Tentreto of the Deep Door",
      card_id: "vaulteveningisles4",
      history_level: 14,
      hazards: [
        Hazards.get(:curse_visions),
        Hazards.get(:guardian_monks),
        Hazards.get(:seal_hiddendoor)
      ]
    },
    %Vault{
      name: "Port Noon",
      card_id: "vaulteveningislesdefault",
      repeatable: true,
      history_level: 14,
      hazards: [
        Hazards.get(:curse_visions),
        Hazards.get(:guardian_long),
        Hazards.get(:peril_sea),
        Hazards.get(:seal_wardeddoor)
      ]
    },
    %Vault{
      name: "'Hebe Stanton'",
      card_id: "vaultfloating1",
      history_level: nil,
      hazards: [
        Hazards.get(:guardian_watchers),
        Hazards.get(:peril_sea),
        Hazards.get(:seal_wardeddoor)
      ]
    }
  ]

  def vaults, do: @vaults
end