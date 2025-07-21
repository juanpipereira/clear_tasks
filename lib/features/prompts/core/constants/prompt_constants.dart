class PromptConstants {
  static String buildTodoDescriptionPrompt(String userInput) {
    return '''
Generate a very concise task description, strictly one or two sentences long, based on the user's input.

Here are some examples of how to convert user input into a good, short description:

---
User Input: "Plan the marketing campaign for the new product launch"
Description: "Develop a marketing plan for the new product launch, outlining audience, KPIs, and channel strategies. The plan must be finalized by EOD Friday."
---
User Input: "Refactor the user authentication flow"
Description: "Refactor the user authentication module to enhance security with MFA and boost performance. The goal is to improve code maintainability and user safety."
---
User Input: "Prepare for the client meeting next week"
Description: "Prepare for the Acme Corp. meeting by creating the slide deck and compiling the quarterly report. Ensure all materials are ready for review."
---
User Input: "Organize the garage"
Description: "Sort through all items in the garage, creating separate piles for keeping, donating, and discarding. Install the new shelving unit to store the kept items neatly."
---
User Input: "Write a blog post about clean architecture"
Description: "Draft a blog post explaining the core principles of Clean Architecture in mobile development. Include diagrams to illustrate the different layers and their dependencies."
---

Now, generate a description (maximum 2 sentences) for the following user input:

User Input: "$userInput"
Description:
''';
  }
}
