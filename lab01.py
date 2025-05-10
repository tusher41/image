import speech_recognition as sr

recognizer = sr.Recognizer()

# Record and save audio
with sr.Microphone() as source:
    print("Calibrating...")
    recognizer.adjust_for_ambient_noise(source)
    print("Recording...")
    audio = recognizer.listen(source)

# Save the audio to file
with open("recorded_audio.wav", "wb") as f:
    f.write(audio.get_wav_data())
    print("Audio saved.")

# Recognize speech
try:
    text = recognizer.recognize_google(audio)
    print("You said:", text)
except (sr.UnknownValueError, sr.RequestError):
    print("Error recognizing speech.")
