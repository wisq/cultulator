###                                        ###
### AUTOMATICALLY GENERATED.  DO NOT EDIT. ###
###                                        ###

defmodule Cultulator.Expedition.Data.Hazards do
  alias Cultulator.Expedition.Hazard

  @hazards %{
    curse_affliction: %Hazard{
      name: "Creeping Breath Curse",
      card_id: "curse_affliction",
      curse: true,
      aspects: [:grail, :heart]
    },
    curse_dread: %Hazard{
      name: "Dry Soul Curse",
      card_id: "curse_dread",
      curse: true,
      aspects: [:heart, :lantern]
    },
    curse_nowhere: %Hazard{
      name: "Worms in the World",
      card_id: "curse_nowhere",
      curse: true,
      aspects: [:lantern, :moth]
    },
    curse_visions: %Hazard{
      name: "Fifth Eye Curse",
      card_id: "curse_visions",
      curse: true,
      aspects: [:heart, :winter]
    },
    guardian_dead: %Hazard{
      name: "Fretful Dead",
      card_id: "guardian_dead",
      aspects: [:edge, :winter]
    },
    guardian_long: %Hazard{
      name: "Long",
      card_id: "guardian_long",
      aspects: [:grail, :moth]
    },
    guardian_monks: %Hazard{
      name: "Monks",
      card_id: "guardian_monks",
      aspects: [:edge, :moth]
    },
    guardian_serpent: %Hazard{
      name: "Younger Sister",
      card_id: "guardian_serpent",
      aspects: [:edge, :knock]
    },
    guardian_soucouyants: %Hazard{
      name: "Soucouyants",
      card_id: "guardian_soucouyants",
      aspects: [:lantern, :moth]
    },
    guardian_watchers: %Hazard{
      name: "Watchers",
      card_id: "guardian_watchers",
      aspects: [:edge, :grail, :moth]
    },
    peril_desert: %Hazard{
      name: "Desolation",
      card_id: "peril_desert",
      aspects: [:forge, :grail]
    },
    peril_forest: %Hazard{
      name: "Peril-Prowled Forest",
      card_id: "peril_forest",
      aspects: [:forge, :moth]
    },
    peril_mountains: %Hazard{
      name: "High Passes",
      card_id: "peril_mountains",
      aspects: [:forge, :winter]
    },
    peril_sea: %Hazard{
      name: "Western Sea",
      card_id: "peril_sea",
      aspects: [:forge, :heart]
    },
    peril_treacherousground: %Hazard{
      name: "Treacherous Ground",
      card_id: "peril_treacherousground",
      aspects: [:forge, :lantern]
    },
    seal_hiddendoor: %Hazard{
      name: "Hidden Door",
      card_id: "seal_hiddendoor",
      aspects: [:knock, :lantern]
    },
    seal_wardeddoor: %Hazard{
      name: "Warded Door",
      card_id: "seal_wardeddoor",
      aspects: [:forge, :knock]
    }
  }

  def get(id), do: Map.fetch!(@hazards, id)
end