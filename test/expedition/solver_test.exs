defmodule Cultulator.Expedition.SolverTest do
  use ExUnit.Case
  doctest Cultulator.Expedition.Solver

  alias Cultulator.Expedition.Solver
  alias Cultulator.Expedition.Solver.Combo
  alias Cultulator.Expedition.{Vault, Hazard}

  test "a vault with no hazards requires no aspects" do
    vault = %Vault{
      name: "Dummy vault with no hazards",
      history_level: 0,
      hazards: []
    }

    assert Solver.solve(vault) == [
             %Combo{for_success: [], for_no_curse: []}
           ]
  end

  test "a vault with a hazard can be solved with either aspect" do
    vault = %Vault{
      name: "Simple vault with one hazard",
      history_level: 0,
      hazards: [
        %Hazard{
          name: "Barrier that needs lantern or moth",
          aspects: [:lantern, :moth]
        }
      ]
    }

    assert Solver.solve(vault) == [
             %Combo{for_success: [:lantern], for_no_curse: []},
             %Combo{for_success: [:moth], for_no_curse: []}
           ]
  end

  test "a vault with a curse needs aspects to avoid the curse" do
    vault = %Vault{
      name: "Simple vault with a curse",
      history_level: 0,
      hazards: [
        %Hazard{
          name: "Curse that needs knock or edge",
          curse: true,
          aspects: [:knock, :edge]
        }
      ]
    }

    assert Solver.solve(vault) == [
             %Combo{for_success: [], for_no_curse: [:edge]},
             %Combo{for_success: [], for_no_curse: [:knock]}
           ]
  end

  test "a vault with a hazard and a curse needs aspects for both success and no curse" do
    vault = %Vault{
      name: "Vault with one hazard and one curse",
      history_level: 0,
      hazards: [
        %Hazard{
          name: "Barrier that needs lantern or moth",
          aspects: [:lantern, :moth]
        },
        %Hazard{
          name: "Curse that needs knock or edge",
          curse: true,
          aspects: [:knock, :edge]
        }
      ]
    }

    assert Solver.solve(vault) == [
             %Combo{for_success: [:lantern], for_no_curse: [:edge]},
             %Combo{for_success: [:lantern], for_no_curse: [:knock]},
             %Combo{for_success: [:moth], for_no_curse: [:edge]},
             %Combo{for_success: [:moth], for_no_curse: [:knock]}
           ]
  end

  test "a vault with an overlapping barrier and curse will only recommend the overlap" do
    vault = %Vault{
      name: "Vault with one hazard and one curse, with one overlapping aspect",
      history_level: 0,
      hazards: [
        %Hazard{
          name: "Barrier that needs lantern or moth",
          aspects: [:lantern, :moth]
        },
        %Hazard{
          name: "Curse that needs moth or edge",
          curse: true,
          aspects: [:moth, :edge]
        }
      ]
    }

    assert Solver.solve(vault) == [
             %Combo{for_success: [:moth], for_no_curse: []}
           ]
  end

  @shared_hazards [
    %Hazard{
      name: "Barrier that needs lantern or moth",
      aspects: [:lantern, :moth]
    },
    %Hazard{
      name: "Barrier that needs lantern or edge",
      aspects: [:lantern, :edge]
    },
    %Hazard{
      name: "Barrier that needs knock or edge",
      aspects: [:knock, :edge]
    }
  ]

  test "a complex vault with a matrix of options" do
    vault = %Vault{
      name: "Vault with several hazards",
      history_level: 0,
      hazards: @shared_hazards
    }

    assert Solver.solve(vault) == [
             %Combo{for_success: [:lantern, :edge], for_no_curse: []},
             %Combo{for_success: [:moth, :edge], for_no_curse: []},
             %Combo{for_success: [:lantern, :knock], for_no_curse: []}
           ]
  end

  test "adding a hazard with a common aspect will eliminate solutions without that aspect" do
    vault = %Vault{
      name: "Vault with an extra hazard that forces edge",
      history_level: 0,
      hazards:
        @shared_hazards ++
          [
            %Hazard{
              name: "Barrier that needs edge or heart",
              aspects: [:edge, :heart]
            }
          ]
    }

    assert Solver.solve(vault) == [
             %Combo{for_success: [:lantern, :edge], for_no_curse: []},
             %Combo{for_success: [:moth, :edge], for_no_curse: []}
             # omitted: [:lantern, :knock, :heart]
           ]
  end

  test "a complex vault with an overlapping curse" do
    vault = %Vault{
      name: "Vault with several hazards and a curse",
      history_level: 0,
      hazards:
        @shared_hazards ++
          [
            %Hazard{
              name: "Curse that needs moth or knock",
              curse: true,
              aspects: [:moth, :knock]
            }
          ]
    }

    assert Solver.solve(vault) == [
             %Combo{for_success: [:moth, :edge], for_no_curse: []},
             %Combo{for_success: [:lantern, :knock], for_no_curse: []}
           ]
  end

  test "a complex vault with a non-overlapping curse" do
    vault = %Vault{
      name: "Vault with several hazards and a curse",
      history_level: 0,
      hazards:
        @shared_hazards ++
          [
            %Hazard{
              name: "Curse that needs winter or forge",
              curse: true,
              aspects: [:winter, :forge]
            }
          ]
    }

    assert Solver.solve(vault) == [
             %Combo{for_success: [:lantern, :edge], for_no_curse: [:forge]},
             %Combo{for_success: [:lantern, :edge], for_no_curse: [:winter]},
             %Combo{for_success: [:moth, :edge], for_no_curse: [:forge]},
             %Combo{for_success: [:moth, :edge], for_no_curse: [:winter]},
             %Combo{for_success: [:lantern, :knock], for_no_curse: [:forge]},
             %Combo{for_success: [:lantern, :knock], for_no_curse: [:winter]}
           ]
  end
end
