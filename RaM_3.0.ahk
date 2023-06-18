;Reset and Move by Four, made to work with duncan's auto reset mod.
;Rename all practice worlds to begin with an _ to keep them from being relocated


#NoEnv
#SingleInstance Force
global SavesDirectory := "<C:\Users\user\AppData\Roaming\.minecraft\saves\>"
global delay := 37 ; Frame delay (1 frame = 16.66, round up to be safe)

SetKeyDelay, 0

IfNotExist, %SavesDirectory%
   msgBox, Please set your saves directory!!!

IfNotExist, %SavesDirectory%_oldWorlds
   FileCreateDir, %SavesDirectory%_oldWorlds


Move()
{
	Loop, Files, %SavesDirectory%*, D
   {
     _Check :=SubStr(A_LoopFileName,1,1)
      If (_Check!="_")
      {
        FileMoveDir, %SavesDirectory%%A_LoopFileName%, %SavesDirectory%_oldWorlds\%A_LoopFileName%%A_NowUTC%, R
      }
   }
}

ExitWorld()
{
   send {Esc}+{Tab}{Enter}
}


#IfWinActive, Minecraft
{

U:: ; Reset 
   ExitWorld()
   Move()
return

}
