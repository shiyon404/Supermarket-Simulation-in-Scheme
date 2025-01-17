# Supermarket Simulation in Scheme

A discrete event-driven supermarket checkout lane simulation system implemented in Racket.

## Table of Contents
- [Requirements](#requirements)
- [Installation](#installation)
- [Features](#features)
- [Components](#components)
- [Usage](#usage)
- [License](#license)

## Requirements
- DrRacket 8.0+
- Windows 10/11
- Git (optional)

## Installation

Using Git:
```powershell
git clone https://github.com/shiyon404/Supermarket-Simulation-in-Scheme.git
cd Supermarket-Simulation-in-Scheme
```

Manual installation:
1. Download ZIP from GitHub
2. Extract to desired location
3. Open project in DrRacket

## Features
- Multi-lane checkout simulation
- Priority queue based event system
- Real-time simulation clock (HH:MM:SS)
- Dynamic lane assignment
- Customer flow tracking
- Queue length monitoring

## Components
- 

sim-sim.rkt

 - Main simulation engine
- 

sim-event.rkt

 - Event handling
- 

sim-lane.rkt

 - Lane management
- 

sim-utils.rkt

 - Utility functions
- 

sim-event-queue.rkt

 - Priority queue
- 

sim-lane-list.rkt

 - Lane selection logic

## Usage
1. Run the simulation:
```racket
racket sim-sim.rkt
```

2. Enter parameters when prompted:
```
N (number of customers)
M (number of lanes)
```

## License
MIT License. See 

LICENSE

 for details.

## Contributors
- shiyon404
- Abhishek Soni (001344975)
- Shiyon Suresh (001306030)
