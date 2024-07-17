// SPDX-License-Identifier: BSD-3-Clause
// SPDX-FileCopyrightText: 2020-2024 The Monero Project

#ifndef FEATHER_WIZARDMENU_H
#define FEATHER_WIZARDMENU_H

#include <QLabel>
#include <QWizardPage>
#include <QWidget>

namespace Ui {
    class PageMenu;
}

class PageMenu : public QWizardPage
{
    Q_OBJECT

public:
    explicit PageMenu(WizardFields *fields, WalletKeysFilesModel *wallets, QWidget *parent = nullptr);
    void initializePage() override;
    bool validatePage() override;
    int nextId() const override;

private:
    Ui::PageMenu *ui;
    WalletKeysFilesModel *m_walletKeysFilesModel;
    WizardFields *m_fields;

    WalletWizard::Page m_nextPage;
};

#endif //FEATHER_WIZARDMENU_H
