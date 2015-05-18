defmodule VidStoreTest do
  import Should
  use ExUnit.Case

  def video, do: %Video{title: "Short Circuit"}

  should "update count" do
    rented_video = VidStore.renting(video)
    assert rented_video.times_rented == 1
  end

  should "rent video" do
    rented_video = VidStore.rent video
    assert :rented == rented_video.state
    assert 1 == Enum.count rented_video.log
  end

  should "handle multiple transitions" do
    import VidStore
    vid = video |> rent |> return |> rent |> return |> rent
    assert 5 == Enum.count vid.log
    assert 3 == vid.times_rented

    vid = video |> rent |> lose |> find |> rent |> return
    assert 5 == Enum.count vid.log
    assert 2 == vid.times_rented

    vid = video |> rent |> lose |> find |> return
    assert 4 == Enum.count vid.log
    assert 1 == vid.times_rented
  end

  should "record before/after hooks in logs" do
    import VidStore
    vid = video |> rent
    assert vid.log == ["Rented Short Circuit",
                       "Renting Short Circuit",
                       "About to rent Short Circuit"]
  end
end
