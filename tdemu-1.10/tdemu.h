/*
	Task Dialog Emulation Library
	Copyright © 2008-2009 KoroSoft

	You may use and redistribute this library free of charge, as long as you
	redistribute the unmodified DLL. If the software is not free or commercial,
	the About box must contain the following text:

	"This software uses user interface code by KoroSoft."
*/

#ifndef _TDEMU_H_
#define _TDEMU_H_

#ifdef TDEMU_EXPORTS
#define TDEMUAPI __stdcall
#else
#define TDEMUAPI __declspec(dllimport) __stdcall
#endif

#ifdef __cplusplus
extern "C"
{
#endif

/*
	Real emulated APIs
*/

HRESULT TDEMUAPI TaskDialogEmulate(
	HWND hWndParent,
	HINSTANCE hInstance,
	PCWSTR pszWindowTitle,
	PCWSTR pszMainInstruction,
	PCWSTR pszContent,
	TASKDIALOG_COMMON_BUTTON_FLAGS dwCommonButtons,
	PCWSTR pszIcon,
	int* pnButton);

HRESULT TDEMUAPI TaskDialogIndirectEmulate(
	const TASKDIALOGCONFIG* pTaskConfig,
	int* pnButton,
	int* pnRadioButton,
	BOOL* pfVerificationFlagChecked);

/*
	Control APIs
*/

HRESULT TDEMUAPI TaskDialogSetEmulation(
	BOOL bAlwaysEmulate);

#ifdef __cplusplus
};
#endif

#endif // _TDEMU_H_
