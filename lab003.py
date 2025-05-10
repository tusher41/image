import pyaudio
import speech_recognition as sr

def main():
    recognizer = sr.Recognizer()
    mic = sr.Microphone()
    print("Real-time Speech Recognition started. Speak into the microphone...")

    try:
        with mic as source:
            recognizer.adjust_for_ambient_noise(source)
            while True:
                print("\nListening...")
                audio = recognizer.listen(source)
                try:
                    text = recognizer.recognize_google(audio)
                    print(f"Recognized: {text}")
                except sr.UnknownValueError:
                    print("Sorry, could not understand audio.")
                except sr.RequestError as e:
                    print(f"Could not request results; {e}")
    except KeyboardInterrupt:
        print("\nStopped by user.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()
