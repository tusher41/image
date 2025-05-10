import speech_recognition as sr

r = sr.Recognizer()
with sr.Microphone() as src:
    r.adjust_for_ambient_noise(src)
    print("Start speaking... (Ctrl+C to stop)")
    while True:
        try:
            audio = r.listen(src)
            print("You said:", r.recognize_google(audio))
        except sr.UnknownValueError:
            print("Didn't catch that.")
        except sr.RequestError:
            print("API error.")
        except KeyboardInterrupt:
            print("\nStopped.")
            break
