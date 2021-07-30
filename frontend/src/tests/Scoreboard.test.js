import React from "react";
import { render, screen, waitForElement } from "@testing-library/react";

import Scoreboard from "../components/Scoreboard.js";

const playerMocks = {
  players: [
      { id: 1, name: "Jeff", wins: 10, losses: 2, draws: 4, win_ratio: 0.62 },
      { id: 2, name: "Steve", wins: 20, losses: 5, draws: 10, win_ratio: 0.57 },
      { id: 3, name: "Bob", wins: 0, losses: 2, draws: 1, win_ratio: 0 },
    ]
};

describe("Scoreboard: ", () => {
  it("should render", async () => {
    const component = render(<Scoreboard {...playerMocks} />);

    expect(component.queryByTestId("game-scoreboard")).not.toBeNull();
    expect(component.queryByText("Win Ratio")).not.toBeNull();
  });
});
