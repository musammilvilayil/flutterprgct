# On-device model assets

Only verified, redistributable model files should be stored here.

The app deliberately does **not** include an emotion model. Emotion inference is
out of scope.

`gesture_recognizer.task` is intentionally not committed until its upstream
model hash and redistribution notice are recorded in MODEL_CATALOG.md. The
Android integration rejects the feature with an actionable message if the asset
is absent; it never returns a made-up sign result.

Each model must have source, version, license, input shape, labels and validation metrics documented before inclusion.
