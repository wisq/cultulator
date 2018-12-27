defmodule Cultulator.Expedition.Data do
  alias Cultulator.Expedition.{Hazard, Vault}

  @hazards %{
    creeping_breath_curse: %Hazard{
      name: "Creeping Breath Curse",
      curse: true,
      aspects: [:heart, :grail]
    },
    desolation: %Hazard{
      name: "Desolation",
      aspects: [:forge, :grail]
    },
    dry_soul_curse: %Hazard{
      name: "Dry Soul Curse",
      curse: true,
      aspects: [:heart, :lantern]
    },
    fifth_eye_curse: %Hazard{
      name: "Fifth Eye Curse",
      curse: true,
      aspects: [:heart, :winter]
    },
    fretful_dead: %Hazard{
      name: "Fretful Dead",
      aspects: [:edge, :winter]
    },
    hidden_door: %Hazard{
      name: "Hidden Door",
      aspects: [:lantern, :knock]
    },
    high_passes: %Hazard{
      name: "High Passes",
      aspects: [:forge, :winter]
    },
    long: %Hazard{
      name: "Long",
      aspects: [:moth, :grail]
    },
    monks: %Hazard{
      name: "Monks",
      aspects: [:edge, :moth]
    },
    peril_prowed_forest: %Hazard{
      name: "Peril Prowed Forest",
      aspects: [:forge, :moth]
    },
    soucouyants: %Hazard{
      name: "Soucouyants",
      aspects: [:lantern, :moth]
    },
    treacherous_ground: %Hazard{
      name: "Treacherous Ground",
      aspects: [:forge, :lantern]
    },
    warded_door: %Hazard{
      name: "Warded Door",
      aspects: [:forge, :knock]
    },
    watchers: %Hazard{
      name: "Watchers",
      aspects: [:edge, :grail, :moth]
    },
    western_sea: %Hazard{
      name: "Western Sea",
      aspects: [:heart, :forge]
    },
    worms_in_the_world: %Hazard{
      name: "Worms in the World",
      aspects: [:lantern, :moth]
    },
    younger_sister: %Hazard{
      name: "Younger Sister",
      aspects: [:edge, :knock]
    }
  }

  @vaults [
    #
    # Level 2: In the Capital
    #
    %Vault{
      name: "Cater & Hero Limited",
      history_level: 2,
      hazards: [
        Map.fetch!(@hazards, :treacherous_ground)
      ]
    },
    %Vault{
      name: "Forgotten Mithraeum",
      history_level: 2,
      hazards: [
        Map.fetch!(@hazards, :hidden_door)
      ]
    },
    %Vault{
      name: "St. Agnes Hospital",
      history_level: 2,
      hazards: [
        Map.fetch!(@hazards, :dry_soul_curse)
      ]
    },
    %Vault{
      name: "Strathcoyne's Residence",
      history_level: 2,
      hazards: [
        Map.fetch!(@hazards, :watchers)
      ]
    },
    %Vault{
      name: "Congregation of St Felix",
      history_level: 2,
      hazards: [
        # From wiki, but unconfirmed.  Seems redundant with monks:
        # Map.fetch!(@hazards, :watchers),
        Map.fetch!(@hazards, :monks)
      ]
    },
    %Vault{
      name: "Forsaken Reach",
      repeatable: true,
      history_level: 2,
      hazards: [
        Map.fetch!(@hazards, :treacherous_ground),
        Map.fetch!(@hazards, :watchers)
      ]
    },

    #
    # Level 4: In the Shires
    #
    %Vault{
      name: "Crowkiss Hill",
      history_level: 4,
      hazards: [
        Map.fetch!(@hazards, :warded_door)
      ]
    },
    %Vault{
      name: "Gladwyn Lake",
      history_level: 4,
      hazards: [
        Map.fetch!(@hazards, :younger_sister)
      ]
    },
    %Vault{
      name: "Gwaer Inn",
      history_level: 4,
      hazards: [
        Map.fetch!(@hazards, :watchers),
        Map.fetch!(@hazards, :warded_door)
      ]
    },
    %Vault{
      name: "Keglin's Scratch",
      history_level: 4,
      hazards: [
        Map.fetch!(@hazards, :fretful_dead),
        Map.fetch!(@hazards, :treacherous_ground)
      ]
    },
    %Vault{
      name: "Lockwood Fen",
      history_level: 4,
      hazards: [
        Map.fetch!(@hazards, :treacherous_ground),
        Map.fetch!(@hazards, :watchers)
      ]
    },
    %Vault{
      name: "Kerisham",
      repeatable: true,
      history_level: 4,
      hazards: [
        Map.fetch!(@hazards, :watchers),
        Map.fetch!(@hazards, :warded_door),
        Map.fetch!(@hazards, :fifth_eye_curse)
      ]
    },

    #
    # Level 6: On the Continent.
    # 
    %Vault{
      name: "Chateau Raveline",
      history_level: 6,
      hazards: [
        Map.fetch!(@hazards, :hidden_door),
        Map.fetch!(@hazards, :dry_soul_curse)
      ]
    },
    %Vault{
      name: "Fermier Abbey",
      history_level: 6,
      hazards: [
        Map.fetch!(@hazards, :peril_prowed_forest),
        Map.fetch!(@hazards, :monks)
      ]
    },
    %Vault{
      name: "Forman House",
      history_level: 6,
      hazards: [
        Map.fetch!(@hazards, :fretful_dead),
        Map.fetch!(@hazards, :dry_soul_curse)
      ]
    },
    %Vault{
      name: "Key-Hunter's Garret",
      history_level: 6,
      hazards: [
        Map.fetch!(@hazards, :younger_sister),
        Map.fetch!(@hazards, :hidden_door)
      ]
    },
    %Vault{
      name: "Orthos Wood",
      history_level: 6,
      hazards: [
        Map.fetch!(@hazards, :peril_prowed_forest),
        Map.fetch!(@hazards, :watchers)
      ]
    },
    %Vault{
      name: "Vandershaaf Collection",
      history_level: 6,
      hazards: [
        Map.fetch!(@hazards, :warded_door),
        Map.fetch!(@hazards, :fifth_eye_curse)
      ]
    },
    %Vault{
      name: "Unnumbered Stones",
      repeatable: true,
      history_level: 6,
      hazards: [
        Map.fetch!(@hazards, :peril_prowed_forest),
        Map.fetch!(@hazards, :hidden_door),
        Map.fetch!(@hazards, :watchers)
      ]
    },

    #
    # Level 8: In the Land Beyond the Forest
    #
    %Vault{
      name: "Cave of Candles",
      history_level: 8,
      hazards: [
        Map.fetch!(@hazards, :younger_sister),
        Map.fetch!(@hazards, :high_passes)
      ]
    },
    %Vault{
      name: "Grunewald's Permanent Circus",
      history_level: 8,
      hazards: [
        Map.fetch!(@hazards, :watchers),
        Map.fetch!(@hazards, :worms_in_the_world)
      ]
    },
    %Vault{
      name: "Kusnetsov Endowment",
      history_level: 8,
      hazards: [
        Map.fetch!(@hazards, :treacherous_ground),
        Map.fetch!(@hazards, :watchers),
        Map.fetch!(@hazards, :hidden_door)
      ]
    },
    %Vault{
      name: "Tower Revek",
      history_level: 8,
      hazards: [
        Map.fetch!(@hazards, :hidden_door),
        Map.fetch!(@hazards, :creeping_breath_curse)
      ]
    },
    %Vault{
      name: "Voivode's Citadel",
      history_level: 8,
      hazards: [
        Map.fetch!(@hazards, :hidden_door),
        Map.fetch!(@hazards, :fretful_dead)
      ]
    },
    %Vault{
      name: "Foxlily Meadows",
      repeatable: true,
      history_level: 8,
      hazards: [
        Map.fetch!(@hazards, :watchers),
        Map.fetch!(@hazards, :high_passes),
        Map.fetch!(@hazards, :fifth_eye_curse)
      ]
    },

    #
    # Level 10: In the Rending Mountains
    #
    %Vault{
      name: "Eye of Ikirmawi",
      history_level: 10,
      hazards: [
        Map.fetch!(@hazards, :high_passes),
        Map.fetch!(@hazards, :warded_door),
        Map.fetch!(@hazards, :fifth_eye_curse)
      ]
    },
    %Vault{
      name: "Hunter's Pits",
      history_level: 10,
      hazards: [
        Map.fetch!(@hazards, :watchers),
        Map.fetch!(@hazards, :younger_sister),
        Map.fetch!(@hazards, :high_passes)
      ]
    },
    %Vault{
      name: "Mausoleum of Wolves",
      history_level: 10,
      hazards: [
        Map.fetch!(@hazards, :fretful_dead),
        Map.fetch!(@hazards, :high_passes),
        Map.fetch!(@hazards, :warded_door)
      ]
    },
    %Vault{
      name: "Snow's Keeper",
      history_level: 10,
      hazards: [
        Map.fetch!(@hazards, :fretful_dead),
        Map.fetch!(@hazards, :worms_in_the_world),
        Map.fetch!(@hazards, :high_passes)
      ]
    },
    %Vault{
      name: "Tombs of Shadowless Kings",
      repeatable: true,
      history_level: 10,
      hazards: [
        Map.fetch!(@hazards, :hidden_door),
        Map.fetch!(@hazards, :watchers),
        Map.fetch!(@hazards, :creeping_breath_curse),
        Map.fetch!(@hazards, :high_passes)
      ]
    },

    #
    # Level 12: In the Lone and Level Sands
    #
    %Vault{
      name: "Lagun's Tomb",
      history_level: 12,
      hazards: [
        Map.fetch!(@hazards, :dry_soul_curse),
        Map.fetch!(@hazards, :desolation),
        Map.fetch!(@hazards, :warded_door)
      ]
    },
    %Vault{
      name: "Messana",
      history_level: 12,
      hazards: [
        Map.fetch!(@hazards, :watchers),
        Map.fetch!(@hazards, :desolation),
        Map.fetch!(@hazards, :creeping_breath_curse)
      ]
    },
    %Vault{
      name: "Star-Shattered Fane",
      history_level: 12,
      hazards: [
        Map.fetch!(@hazards, :hidden_door),
        Map.fetch!(@hazards, :desolation),
        Map.fetch!(@hazards, :fifth_eye_curse)
      ]
    },
    %Vault{
      name: "Temple of Seven Coils",
      history_level: 12,
      hazards: [
        Map.fetch!(@hazards, :warded_door),
        Map.fetch!(@hazards, :worms_in_the_world),
        Map.fetch!(@hazards, :desolation)
      ]
    },
    %Vault{
      name: "Miah",
      repeatable: true,
      history_level: 12,
      hazards: [
        Map.fetch!(@hazards, :hidden_door),
        Map.fetch!(@hazards, :desolation),
        Map.fetch!(@hazards, :creeping_breath_curse),
        Map.fetch!(@hazards, :fretful_dead)
      ]
    },

    #
    # Level 14: Among the Evening Isles
    #
    %Vault{
      name: "Fort Geryk",
      history_level: 14,
      hazards: [
        Map.fetch!(@hazards, :fretful_dead),
        Map.fetch!(@hazards, :western_sea),
        Map.fetch!(@hazards, :warded_door)
      ]
    },
    %Vault{
      name: "Hebe Stanton",
      history_level: 14,
      hazards: [
        Map.fetch!(@hazards, :western_sea),
        Map.fetch!(@hazards, :watchers),
        Map.fetch!(@hazards, :warded_door)
      ]
    },
    %Vault{
      name: "Raven Isle",
      history_level: 14,
      hazards: [
        Map.fetch!(@hazards, :soucouyants),
        Map.fetch!(@hazards, :western_sea),
        Map.fetch!(@hazards, :fifth_eye_curse)
      ]
    },
    %Vault{
      name: "St. Tentreto of the Deep Door",
      history_level: 14,
      hazards: [
        Map.fetch!(@hazards, :hidden_door),
        Map.fetch!(@hazards, :monks),
        Map.fetch!(@hazards, :fifth_eye_curse)
      ]
    },
    %Vault{
      name: "Wreck of the Cristabel",
      history_level: 14,
      hazards: [
        Map.fetch!(@hazards, :younger_sister),
        Map.fetch!(@hazards, :western_sea),
        Map.fetch!(@hazards, :creeping_breath_curse)
      ]
    },
    %Vault{
      name: "Port Noon",
      repeatable: true,
      history_level: 14,
      hazards: [
        Map.fetch!(@hazards, :warded_door),
        Map.fetch!(@hazards, :western_sea),
        Map.fetch!(@hazards, :fifth_eye_curse),
        Map.fetch!(@hazards, :long)
      ]
    }
  ]

  def vaults, do: @vaults
end
