import express from "express";
import { TokenManager } from "../services/TokenManager";
import { UserDatabase } from "../database/UserDatabase";
import { UserController } from "../controller/UserController";
import { IdGenerator } from "../services/IdGenerator";
import { UserDTO } from "../dtos/userDTO";
import { UserBusiness } from "../business/userBusiness";
import { HashManager } from "../services/HashManager";
export const userRouter = express.Router()

const userController = new UserController(
    new UserBusiness(
        new UserDatabase(),
        new IdGenerator(),
        new TokenManager(),
        new HashManager()), 
    new UserDTO)


userRouter.get("/", userController.getAllUsers)
userRouter.post("/signup", userController.signUp)
userRouter.post("/login", userController.login)