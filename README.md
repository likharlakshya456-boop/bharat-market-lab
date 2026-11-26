# Bharat Market Lab

A local research dashboard for Indian equities, based on the MIT-licensed [Market Lab](https://github.com/heysanjeevv/market-lab) project. Follow the NSE session, compare sectors against Nifty 50, and test swing strategies on historical data without connecting a broker.

> **For education and research, not investment advice.** Quotes can be delayed or missing. Backtests use today's stock universe and have survivorship bias. Signals are rule outputs, not recommendations, and stop prices do not guarantee fills.

## What you can do

| Area | Features |
| --- | --- |
| Market overview | Nifty 50, Bank Nifty and Sensex at a glance, with an IST clock and NSE session status |
| Smart Money | F&O stock moves from the open, relative displacement, charts and market-structure overlays |
| Sector Map | Compare sector returns with Nifty, drill into constituents, and browse news and company research |
| Swing Lab | Test 23 rule-based strategies on up to five years of NSE daily data; inspect signals, stops and targets on charts |
| Position sizing | Estimate cash-equity share quantity, capital used and loss at the specified stop in INR |

![Smart Money chart and market breadth view from upstream Market Lab](docs/smart-money.jpg)

## Quick start

Download or clone this repository. You need Python 3.10 or newer, internet access and about 1 GB of free disk space. Initial setup downloads data and runs the backtest locally; allow roughly 10–20 minutes, depending on provider availability and your connection.

**macOS / Linux** — from the project directory:

```bash
bash install.sh
bash run.sh
```

On macOS, `bash start.command` combines setup and launch. On Windows, run `install.bat` and then `run.bat` with Python available on your PATH. Keep the terminal open and navigate to [localhost:8810](http://localhost:8810).

If setup is interrupted, rerun the installer. To refresh historical data and rebuild the analysis, run `.venv/bin/python -m lab.setup` on macOS/Linux or `.venv\Scripts\python.exe -m lab.setup` on Windows. `--intraday` adds the optional intraday research download and backtest.

## Data and privacy

- The server binds to `127.0.0.1`; this is a local app, not a GitHub Pages site. No broker account, paid API key, or order execution is required.
- The app fetches data from NSE, Yahoo Finance, Google News RSS and Wikipedia. It also loads fonts and the charting library in the browser. Internet access is required for those resources, and provider terms apply.
- Downloads, generated backtests, local paper-trading journals, and credentials are not part of the repository. Only load cache files you generated yourself.
- Personal Codex schedules are not part of this project. Cloning the repo or running GitHub Actions does not start paper trading or create a broker connection.

## Development

The Python entry point is `app.py`. Feed and market logic live in `sm/` and `sx/`, backtests and research in `lab/`, and the browser UI in `web/`. GitHub Actions validates syntax and application imports without downloading market data or running scheduled trades.

For bug reports, include your operating system, Python version, and the steps to reproduce. Share only sanitized logs; remove credentials and personal trading records.

## Credits and license

Based on [Market Lab by Sanjeev Verma and contributors](https://github.com/heysanjeevv/market-lab). The upstream copyright notice and MIT license are preserved in [LICENSE](LICENSE).
