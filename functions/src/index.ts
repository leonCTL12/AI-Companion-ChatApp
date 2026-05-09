/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

import {setGlobalOptions} from "firebase-functions/v2";
import {HttpsError, onCall} from "firebase-functions/v2/https";
import axios from "axios";

// Start writing functions
// https://firebase.google.com/docs/functions/typescript

// For cost control, you can set the maximum number of containers that can be
// running at the same time. This helps mitigate the impact of unexpected
// traffic spikes by instead downgrading performance. This limit is a
// per-function limit. You can override the limit for each function using the
// `maxInstances` option in the function's options, e.g.
// `onRequest({ maxInstances: 5 }, (req, res) => { ... })`.
// NOTE: setGlobalOptions does not apply to functions using the v1 API. V1
// functions should each use functions.runWith({ maxInstances: 10 }) instead.
// In the v1 API, each function can only serve one request per container, so
// this will be the maximum concurrent request count.
setGlobalOptions({
    region: "asia-east2",
    memory: "256MiB", // Small and cheap for a demo
    maxInstances: 10,
});

const SYSTEM_PROMPT = `
### ROLE
You are 'Echo', a warm, grounded, and empathetic emotional companion. 

### PERSONALITY
- Tone: Casual, respectful, and concise. 
- Style: You speak like a wise, calm friend. You do not use corporate "AI" language.

### BEHAVIOR RULES
1. VALIDATE FIRST: Never offer a solution until you have acknowledged the user's feeling.
2. NO CLICHÉS: Avoid "I'm sorry to hear that" or "As an AI." 
3. VISION: If the user provides an image, comment on a specific visual detail to show you are "present."
4. KEEP IT SHORT: Most responses should be 1-3 sentences.
5. USE whatever language user is using
`;

const MODEL = "nvidia/nemotron-3-nano-omni-30b-a3b-reasoning:free";

export const getChatResponse = onCall({secrets: ["OPENROUTER_API_KEY"]}, async (request) => {
    const apiKey = process.env.OPENROUTER_API_KEY;

    // This will show up in your terminal logs
    if (!apiKey) {
        console.error("❌ CRITICAL: API Key is missing from process.env!");
        throw new HttpsError("internal", "Server configuration error: Missing API Key");
    } else {
        console.log("✅ API Key loaded successfully (starts with: " + apiKey.substring(0, 7) + "...)");
    }

    const history = request.data.history;

    if (!Array.isArray(history)) {
        throw new HttpsError("invalid-argument", "The function must be called with a 'history' array.");
    }

    const messages = [
        {role: "system", content: SYSTEM_PROMPT},
        ...history.map((m: any) => {
            const role = m.fromUser ? "user" : "assistant";

            if (!m.encodedImage) {
                return {
                    role: role,
                    content: m.content,
                };
            }


            return {
                role: role,
                content: [
                    {type: "text", text: m.content},
                    {
                        type: "image_url", image_url: {
                            url: m.encodedImage,
                        },
                    },
                ],
            };
        }),
    ];

    try {
        const response = await axios.post(
            "https://openrouter.ai/api/v1/chat/completions",
            {
                model: MODEL,
                messages: messages,
                temperature: 0.8,
            },
            {
                headers: {
                    "Authorization": `Bearer ${process.env.OPENROUTER_API_KEY}`,
                    "Content-Type": "application/json",
                    "HTTP-Referer": "https://llmbuddy.com",
                    "X-Title": "Echo Companion",
                },
            }
        );

        const aiContent = response.data.choices?.[0]?.message?.content;
        if (aiContent) {
            return {
                message: aiContent,
                status: "success",
            };
        } else {
            throw new HttpsError("internal", "Empty response from OpenRouter.");
        }
    } catch (error: any) {
        console.error("OpenRouter Error:", error.response?.data || error.message);
        throw new HttpsError(
            "internal",
            error.response?.data?.error?.message || "Communication failed"
        );
    }
});