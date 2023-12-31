"use strict";
import Circle from "./circles.js";

window.onload = (event) => {
  fetch(`https://${GetParentResourceName()}/nuiReady`);

  const Container = document.getElementById("Container");
  const ID = document.getElementById("ID");

  const Voice = document.getElementById("VoiceIndicator");

  const Armour = document.getElementById("ArmourIndicator");
  const Stamina = document.getElementById("StaminaIndicator");
  const Oxygen = document.getElementById("OxygenIndicator");
  const Health = document.getElementById("HealthIndicator");
  const Hunger = document.getElementById("HungerIndicator");
  const Thirst = document.getElementById("ThirstIndicator");
  const Drunk = document.getElementById("DrunkIndicator");
  const Stress = document.getElementById("StressIndicator");
  const HealthIcon = document.getElementById("HealthIcon");

  const VoiceIcon = document.getElementById("VoiceIcon");
  const OxygenIcon = document.getElementById("OxygenIcon");
  const HungerIcon = document.getElementById("HungerIcon");
  const ThirstIcon = document.getElementById("ThirstIcon");
  const StressIcon = document.getElementById("StressIcon");
  const DrunkIcon = document.getElementById("DrunkIcon");

  const Speedometer = document.getElementById("SpeedoContainer");
  const Seatbelt = document.getElementById("SeatbeltIcon");
  const Nitrous = document.getElementById("NitrousIndicator");

  Circle.VoiceIndicator.animate(0.66);

  window.addEventListener("message", function (event) {
    let action = event.data.action;
    let data = event.data.message;

    if (action === "toggleHud") {
      Container.style.display = data ? "flex" : "none";
    }

    if (action === "setPlayerId") {
      if (data) {
        ID.style.display = "block";
        ID.textContent = "#" + data;
      } else {
        ID.style.display = "none";
      }
    }

    if (action === "setHealth") {
      Health.style.display = "block";

      let health = (data.current - 100) / (data.max - 100);
      health < 0 && (health = 0);

      if (health) {
        HealthIcon.classList.remove("fa-skull");
        HealthIcon.classList.add("fa-heart");
      } else {
        HealthIcon.classList.remove("fa-heart");
        HealthIcon.classList.add("fa-skull");
      }

      Circle.HealthIndicator.trail.setAttribute(
        "stroke",
        health ? "rgb(35, 35, 35)" : "rgb(255, 0, 0)"
      );
      Circle.HealthIndicator.path.setAttribute(
        "stroke",
        health ? "rgb(0, 255, 100)" : "rgb(255, 0, 0)"
      );
      Circle.HealthIndicator.animate(health);
    }

    if (action === "setArmour") {
      Armour.style.display = "block";
      Circle.ArmourIndicator.animate(data / 100, function () {
        Armour.style.display = data === 0 && "none";
      });
    }

    if (action === "setStamina") {
      if (data) {
        Stamina.style.display = "block";

        let stamina = data.current / data.max;
        stamina < 0 && (stamina = 0);
        stamina < 0.1 && StaminaIcon.classList.toggle("flash");

        Circle.StaminaIndicator.path.setAttribute(
          "stroke",
          stamina < 0.1 ? "rgb(255, 0, 0)" : "rgb(255, 255, 200)"
        );
        Circle.StaminaIndicator.animate(stamina);
      } else {
        Circle.StaminaIndicator.animate(1, function () {
          Stamina.style.display = "none";
        });
      }
    }

    if (action === "setOxygen") {
      if (data) {
        Oxygen.style.display = "block";

        let oxygen = data.current / data.max;
        oxygen < 0 && (oxygen = 0);
        oxygen < 0.1 && OxygenIcon.classList.toggle("flash");

        Circle.OxygenIndicator.path.setAttribute(
          "stroke",
          oxygen < 0.1 ? "rgb(255, 0, 0)" : "rgb(0, 140, 255)"
        );
        Circle.OxygenIndicator.animate(oxygen);
      } else {
        Circle.OxygenIndicator.animate(1, function () {
          Oxygen.style.display = "none";
        });
      }
    }

    if (action === "setVehicle") {
      if (data) {
        Speedometer.style.display = "flex";

        let isMetricMultiplier = data.isMetric ? 3.6 : 2.236936;
        let speed = data.speed.current * isMetricMultiplier;
        let rpm = data.rpm && data.rpm;
        let fuel = data.fuel && data.fuel / 100;
        let nitrous = data.nitrous && (data.nitrous / 500) * 100;

        let speedValue = document.getElementById("currentSpeed");
        let measurementType = document.getElementById("metricType");
        let metricType = data.isMetric ? "kmh" : "mph";

        speedValue.innerHTML = speed.toFixed(0);
        measurementType.innerHTML = metricType;

        if (nitrous == null || nitrous === 0) {
          Nitrous.style.display = "none";
        } else {
          Nitrous.style.display = "block";
        }

        if (data.electric === true) {
          Circle.FuelIndicator.path.setAttribute(
            "stroke",
            fuel > 0.15 ? "rgb(30,204,8)" : "rgb(255, 0, 0)"
          );
        } else {
          Circle.FuelIndicator.path.setAttribute(
            "stroke",
            fuel > 0.15 ? "rgb(249,195,7)" : "rgb(255, 0, 0)"
          );
        }

        Circle.NitrousIndicator.path.setAttribute(
          "stroke",
          nitrous > 0.15 ? "rgb(0,255,187)" : "rgb(255,0,0)"
        );

        Circle.RpmIndicator.animate(rpm);
        Circle.FuelIndicator.animate(fuel);
        Circle.NitrousIndicator.animate(nitrous);
      } else {
        Speedometer.style.display = "none";
      }
    }

    if (action === "setVoice") {
      Voice.style.display = "block";
      if (data === "disconnected") {
        VoiceIcon.classList.remove("fa-microphone");
        VoiceIcon.classList.add("fa-times");
        Circle.VoiceIndicator.path.setAttribute("stroke", "rgb(255, 0, 0)");
        Circle.VoiceIndicator.trail.setAttribute("stroke", "rgb(255, 0, 0)");
      } else {
        VoiceIcon.classList.remove("fa-times");
        VoiceIcon.classList.add("fa-microphone");
        Circle.VoiceIndicator.path.setAttribute(
          "stroke",
          data ? "rgb(255, 255, 0)" : "rgb(169, 169, 169)"
        );
        Circle.VoiceIndicator.trail.setAttribute("stroke", "rgb(35, 35, 35)");
      }
    }

    if (action === "setVoiceRange") {
      switch (data) {
        case 0:
          data = 15;
          break;
        case 1:
          data = 33;
          break;
        case 2:
          data = 66;
          break;
        case 3:
          data = 100;
          break;
        default:
          data = 33;
          break;
      }

      Circle.VoiceIndicator.animate(data / 100);
    }

    if (action === "status") {
      Hunger.style.display = "block";
      Thirst.style.display = "block";
      Stress.style.display = data.stress > 5 && "block";
      Drunk.style.display = data.drunk > 5 && "block";

      data.hunger < 15 && HungerIcon.classList.toggle("flash");
      data.thirst < 15 && ThirstIcon.classList.toggle("flash");
      data.stress > 50 && StressIcon.classList.toggle("flash");
      data.drunk > 50 && DrunkIcon.classList.toggle("flash");

      Circle.HungerIndicator.animate(data.hunger / 100);
      Circle.ThirstIndicator.animate(data.thirst / 100);

      Circle.StressIndicator.animate(data.stress / 100, function () {
        Stress.style.display = data.stress <= 5 && "none";
      });
      Circle.DrunkIndicator.animate(data.drunk / 100, function () {
        Drunk.style.display = data.drunk <= 5 && "none";
      });
    }

    if (action === "setSeatbelt") {
      if (data.buckled) {
        Seatbelt.classList.remove("flash");
        Seatbelt.style.color = "rgb(0, 255, 100)";
      } else {
        Seatbelt.classList.add("flash");
        Seatbelt.style.color = "rgb(255, 0, 100)";
      }
    }
  });
};
