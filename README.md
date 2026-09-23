# Lecture 02 – Sampling and Aliasing

## Objective

Investigate how sampling a one-second, 10 Hz vibration signal at different rates changes its digital representation. Run `Lecture02_sampling_aliasing.m` in MATLAB from this directory to regenerate the six PNG figures.

## Nyquist Analysis

The highest frequency is 10 Hz, so the theoretical Nyquist rate is `f_s = 2 f_max = 2(10) = 20 Hz`. Among the assigned rates, 20, 25, 50, and 100 Hz meet `f_s >= 20 Hz`; 15 Hz does not. Equality is a fragile boundary: for the specific zero-phase sine wave here, `sin(2π·10·n/20) = sin(πn) = 0` for every integer `n`. These all-zero samples cannot establish the original amplitude or distinguish it from the zero signal. Sampling exactly at 20 Hz is therefore unsuitable in practice, despite meeting the nominal rate inequality.

## Results

| Sampling rate | Samples per cycle | Observation |
| --- | ---: | --- |
| 15 Hz | 1.5 | Aliases to an apparent 5 Hz signal; the sample points misrepresent the original frequency. |
| 20 Hz | 2 | Every sample of this zero-phase sine is zero; amplitude information is lost at the Nyquist boundary. |
| 25 Hz | 2.5 | No ideal aliasing for this 10 Hz tone, though the waveform is sparsely represented. |
| 50 Hz | 5 | Samples track the waveform well with moderate data volume. |
| 100 Hz | 10 | Denser representation, with twice the sample volume of 50 Hz. |

Each figure overlays the original 10 Hz curve with the actual samples. The continuous curve is a reference; plotting it does not restore information lost in sampling.

## Aliasing Discussion

At 15 Hz, the 10 Hz tone is above the 7.5 Hz Nyquist frequency and folds to `|10 − 15| = 5 Hz`. This happens because sampled frequencies separated by integer multiples of the sampling rate produce identical sample sequences. At 20 Hz, this particular sine falls entirely on zero crossings; this is a boundary ambiguity, even though 20 Hz satisfies the theoretical inequality. At 25, 50, and 100 Hz, the ideal 10 Hz tone does not alias. Real vibration signals may contain higher frequencies than the assumed 10 Hz maximum: those components must be limited by an analog anti-alias filter before sampling. Timing error, noise, and filter transition bands also favor a rate above the minimum.

## Engineering Recommendation

Choose **50 Hz** for the stated bandlimited 10 Hz signal: five samples per cycle give a clear representation, a 25 Hz Nyquist frequency leaves room for a practical analog filter above 10 Hz, and processing/storage costs are half those at 100 Hz. If the actual sensor has significant content above 10 Hz, measure its bandwidth and redesign the filter and rate accordingly. Sampling exactly at 20 Hz is not recommended.

## AI Usage

- **AI Tool Used:** ChatGPT (Codex).
- **Prompt(s):** “帮我做吧直接” with six screenshots of the Lecture 02 assignment, specifying a 10 Hz sine wave, five sampling frequencies, MATLAB code, figures, Nyquist and aliasing analysis, and a README.
- **Summary of AI Response:** Produced a MATLAB script, six reference PNG plots, and this analysis; calculated the 20 Hz Nyquist rate and the 15 Hz to 5 Hz alias.
- **What I Modified:** The assistant prepared the initial deliverables. Before submitting, review the explanation and record any changes you personally make here.
- **How I Verified the Results:** Checked the sample-time equations analytically: `sin(2π·10·n/20)=0`, while at 15 Hz the 10 Hz samples are indistinguishable from a negative-phase 5 Hz sine. Checked that each figure uses samples at `n/f_s`, includes a 1-second reference waveform and labeled axes. MATLAB execution should also be checked locally before submission if available.
