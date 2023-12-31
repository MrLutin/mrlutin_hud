export default {
  HealthIndicator: new ProgressBar.Circle("#HealthIndicator", {
    strokeWidth: 13,
    trailWidth: 13,
    duration: 600,
  }),
  ArmourIndicator: new ProgressBar.Circle("#ArmourIndicator", {
    color: "rgb(0, 140, 255)",
    trailColor: "rgb(35, 35, 35)",
    strokeWidth: 13,
    trailWidth: 13,
    duration: 600,
  }),
  StaminaIndicator: new ProgressBar.Circle("#StaminaIndicator", {
    color: "rgb(255, 255, 204)",
    trailColor: "rgb(35, 35, 35)",
    strokeWidth: 13,
    trailWidth: 13,
    duration: 600,
  }),
  HungerIndicator: new ProgressBar.Circle("#HungerIndicator", {
    color: "rgb(255, 164, 59)",
    trailColor: "rgb(35, 35, 35)",
    strokeWidth: 13,
    trailWidth: 13,
    duration: 600,
  }),
  ThirstIndicator: new ProgressBar.Circle("#ThirstIndicator", {
    color: "rgb(0, 140, 170)",
    trailColor: "rgb(35, 35, 35)",
    strokeWidth: 13,
    trailWidth: 13,
    duration: 600,
  }),
  StressIndicator: new ProgressBar.Circle("#StressIndicator", {
    color: "rgb(255, 74, 104)",
    trailColor: "rgb(35, 35, 35)",
    strokeWidth: 13,
    trailWidth: 13,
    duration: 600,
  }),
  OxygenIndicator: new ProgressBar.Circle("#OxygenIndicator", {
    trailColor: "rgb(35, 35, 35)",
    strokeWidth: 13,
    trailWidth: 13,
    duration: 600,
  }),

  DrunkIndicator: new ProgressBar.Circle("#NitrousIndicator", {
    color: "rgb(86,2,255)",
    trailColor: "rgb(35, 35, 35)",
    strokeWidth: 13,
    trailWidth: 13,
    duration: 600,
  }),
  VoiceIndicator: new ProgressBar.Circle("#VoiceIndicator", {
    strokeWidth: 13,
    trailWidth: 13,
    duration: 100,
  }),

  // Vehicle HUD
  RpmIndicator: new ProgressBar.Line(".rpm", {
    trailColor: "rgb(35, 35, 35)",
    strokeWidth: 4,
    trailWidth: 3,
    duration: 600,
  }),

  NitrousIndicator: new ProgressBar.Line(".nitrous", {
    trailColor: "rgb(35, 35, 35)",
    strokeWidth: 4,
    trailWidth: 3,
    duration: 600,
  }),

  FuelIndicator: new ProgressBar.Line(".fuel", {
    trailColor: "rgb(35, 35, 35)",
    strokeWidth: 4,
    trailWidth: 3,
    duration: 600,
  }),
};
