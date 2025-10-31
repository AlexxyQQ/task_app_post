Here are the updated instructions.

---

### 🚀 How to Run the App

1.  **Ensure Latest Flutter:**
    Open your terminal and run this command to make sure you are on the latest stable version of Flutter:

    ```bash
    flutter upgrade
    ```

2.  **Get Packages:**
    Download all the project's dependencies:

    ```bash
    flutter pub get
    ```

3.  **Create Environment File:**

    - In the project's **root directory**, create a folder named `env`.
    - Inside the `env` folder, create a new file named `.env`.
    - Add the following line to that `.env` file:
      ```
      BASE_URL=https://jsonplaceholder.typicode.com
      ```

    > **Note:** Make sure you have added `env/.env` to your `.gitignore` file to keep your environment variables private.

4.  **Run Build Runner:**
    This command generates the necessary code files. The `--delete-conflicting-outputs` flag is recommended to avoid build conflicts:

    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

5.  **Run the App:**
    Make sure you have an emulator running or a device connected. Then, run the app:

    ```bash
    flutter run
    ```

    _(Flutter automatically uses `lib/main.dart` by default.)_
