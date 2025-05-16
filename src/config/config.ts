import * as dotenv from 'dotenv';
dotenv.config();
export const secretKey = process.env.SECRET_KEY || 'defaultsecret';
